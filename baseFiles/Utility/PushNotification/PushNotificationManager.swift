import UIKit
import Firebase
import FirebaseMessaging
import UserNotifications
import SwiftyJSON
class PushNotificationManager: NSObject, MessagingDelegate, UNUserNotificationCenterDelegate {
      
//    let userID: String
//    init(userID: String) {
//        self.userID = userID
//        super.init()
//    }
    
    func  registerForPushNotifications() {
        
        UNUserNotificationCenter.current().delegate = self
        // request permission from user to send notification
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options:options, completionHandler: { authorized, error in
            if authorized {
                DispatchQueue.main.async(execute: {
                    UIApplication.shared.registerForRemoteNotifications()
                    UNUserNotificationCenter.current().delegate = self
                })
            }
        })
        
        Messaging.messaging().delegate = self

        
//        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
//            UNUserNotificationCenter.current().requestAuthorization(
//                options: authOptions,
//                completionHandler: {_, _ in })
//            UNUserNotificationCenter.current().delegate = self
//            Messaging.messaging().delegate = self
//        UIApplication.shared.registerForRemoteNotifications()
    }
    
    func notificationGetId(fcm:String){
        let param = ["platform":"ios","push_service":"fcm","push_token":fcm,"device_id":UIDevice.current.identifierForVendor!.uuidString]
        HttpUtility.shared.postApiDataJsonWithHeader(requestUrl: AppUrl.notificationPost, param: param){ data in
            self.updateFirestorePushTokenIfNeeded(id:data?.dictionaryValue["id"]?.stringValue ?? "",fcm:fcm)
        }
    }
    
    func updateFirestorePushTokenIfNeeded(id:String,fcm:String) {
        let param = ["id":id,"push_token":fcm,"device_id":UIDevice.current.identifierForVendor!.uuidString] as [String : Any]
        HttpUtility.shared.putApiDataJsonWithHeader(requestUrl: AppUrl.notification(id:id), param: param){ data in
        }
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("Firebase registration token: \(fcmToken)")
        notificationGetId(fcm: fcmToken ?? "")
    }
    
    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingDelegate) {
        //  showAlert(message: remoteMessage.description)
        print("Received data message: \(remoteMessage.description)")
    }
    
  
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler   completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // show the notification alert (banner), and with sound
       
        completionHandler([.alert, .badge, .sound])
        UNUserNotificationCenter.current().delegate = self
        print(notification.request.content.userInfo)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print(response)
        let userInfo = response.notification.request.content.userInfo
        let data = JSON(userInfo)
        print(data)
        
        if ((data.dictionaryValue["thread"]?.stringValue) != nil) {
            let vc = UIStoryboard(name: "EditProfile", bundle: nil).instantiateViewController(identifier:"ConversationVC") as ConversationVC
                    let destVC = ConversationVC.instantiate(storyboard: .editProfile)
                    let nav1 = UINavigationController()
                    nav1.viewControllers = [destVC]
                    nav1.navigationBar.isHidden = true
                    UIApplication.shared.windows.first?.rootViewController = nav1
                    UIApplication.shared.windows.first?.makeKeyAndVisible()
             UIApplication.topViewController()?.present(vc, animated: true, completion: nil)
        }else if ((data.dictionaryValue["user"]?.stringValue) != nil){
            let vc = UIStoryboard(name: "UserProfile", bundle: nil).instantiateViewController(identifier:"UserProfileVc") as UserProfileVc
                    let destVC = UserProfileVc.instantiate(storyboard: .userProfile)
                    destVC.userId = data.dictionaryValue["user"]?.stringValue ?? ""
                    let nav1 = UINavigationController()
                    nav1.viewControllers = [destVC]
                    nav1.navigationBar.isHidden = true
                    UIApplication.shared.windows.first?.rootViewController = nav1
                    UIApplication.shared.windows.first?.makeKeyAndVisible()
             UIApplication.topViewController()?.present(vc, animated: true, completion: nil)
        }else if ((data.dictionaryValue["clip"]?.stringValue) != nil){
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier:"ViewMoreVideoVC") as ViewMoreVideoVC
                    let destVC = ViewMoreVideoVC.instantiate(storyboard: .main)
                    let nav1 = UINavigationController()
                    nav1.viewControllers = [destVC]
                    nav1.navigationBar.isHidden = true
                    UIApplication.shared.windows.first?.rootViewController = nav1
                    UIApplication.shared.windows.first?.makeKeyAndVisible()
             UIApplication.topViewController()?.present(vc, animated: true, completion: nil)
        }
 
        
        //  showAlert(message:"\(response)" )
//        let userInfo = response.notification.request.content.userInfo
//        let data = JSON(userInfo)
//        print(data)
        
//        let vc = UIStoryboard(name: "EditProfile", bundle: nil).instantiateViewController(identifier:"ConversationVC") as ConversationVC
//        UIApplication.topViewController()?.present(vc, animated: true, completion: nil)
    }
}

//extension UIApplication {
//    class func topViewController(base: UIViewController? = (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController) -> UIViewController? {
////        if let nav = base as? UINavigationController {
////            return topViewController(base: nav.visibleViewController)
////        }
//        if let tab = base as? UITabBarController {
//            if let selected = tab.selectedViewController {
//                return topViewController(base: selected)
//            }
//        }
//        if let presented = base?.presentedViewController {
//            return topViewController(base: presented)
//        }
//        return base
//    }
//}
