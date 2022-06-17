//
//  AppConstant.swift
//  Urjas Departmental
//
//  Created by MPPKVVCL on 21/09/20.
//  Copyright © 2020 MPPKVVCL. All rights reserved.
//

import Foundation
import SystemConfiguration
import Alamofire
import MBProgressHUD
import Reachability
import UIKit
// Configure
struct Config {
    
}

struct AppConstant {
    static let videoLimit = 40
}

struct Connectivity {
  static let sharedInstance = NetworkReachabilityManager()!
  static var isConnectedToInternet:Bool {
      return self.sharedInstance.isReachable
    }
}

// Storyboard Identifier
struct StoryBoardIdentifier {
    static let SignUpViewController    = "signUpIdentifier"
}

let window:UIWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.last!






let appDelegate = UIApplication.shared.delegate as! AppDelegate

//Static Strings
struct StaticString {
    static let InternetConnectionAlert = "Internet connection is unavailable"
    static let ServerError = "Server is busy, please try again"
    static let SomeError = "Some error from server, and its notification is already displayed to user"
    static let EmailError = "Email is incorrect."
}

// Screen size
struct Screen {
    static var height: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    static var width: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    static func isIphone6() -> Bool {
        return height == 667 ? true : false
    }
    static func isIphone5() -> Bool {
        return height == 568 ? true : false
    }
    static func isIphone6Plus() -> Bool {
        return height == 736 ? true : false
    }
    static func isIphone4() -> Bool {
        return height == 480 ? true : false
    }
}

//Show alert toast
func showAlertError(message: String) {
    
    let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
      let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(OKAction)
    alert.view.tintColor = UIColor.init(hexString: "C9352D")
   // loadingNotification.label.textColor = UIColor.orange
    window.rootViewController?.present(alert, animated: true, completion: nil)
}




struct StoryBoardName
{
    internal static let mainStoryboard = "Main"
    internal static let campAppStoryboard = "CampApplication"
    internal static let MeterAppStoryboard = "MeterReplacement"
    internal static let nscltAppStoryboard = "NscltApp"
    internal static let userManagementStoryboard = "UserManagement"
   
}

  // MARK:- GifViewCode

func getGifData()->Data
{
    let path = Bundle.main.path(forResource: "emptycart", ofType: "gif")!
    let data = try? Data(contentsOf: URL(fileURLWithPath: path))
    if let gifData = data
    {
        return gifData
    }
    
    return Data()
   
}



//MARK: - Show/Hide HudView(loader)
func showHudWithTitle(title:String?){

    let loadingNotification = MBProgressHUD.showAdded(to: window, animated: true)
    loadingNotification.mode = MBProgressHUDMode.indeterminate
    loadingNotification.label.text =  title!
    //loadingNotification.label.textColor = UIColor.orange
    loadingNotification.alpha = 1.0
}

func showHud(){
    
    let loadingNotification = MBProgressHUD.showAdded(to: window, animated: true)
    loadingNotification.mode = MBProgressHUDMode.indeterminate
    loadingNotification.contentColor = .orange
    loadingNotification.label.text =  "Please wait..."
    loadingNotification.label.textColor = UIColor.orange
    loadingNotification.alpha = 1.0
    
}

func hideHud(){
    DispatchQueue.main.async {
        MBProgressHUD.hide(for:window, animated: true)
    }
}


struct Headers {
    func defaultHeaders() -> HTTPHeaders{
        let headers: HTTPHeaders = ["Authorization": "Bearer " ,
                                    "Content-Type": "application/json"]
        return headers
    }
    
}

//MARK: - Global Button action for storyboard

extension UIViewController{
    @IBAction func navigationBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    static func instantiate(storyboard: UIStoryboard.Storyboard) -> Self {
            let storyboard = UIStoryboard(storyboard: storyboard)
            guard let viewController = storyboard.instantiateViewController(withIdentifier: self.nameOfClass) as? Self else {
                fatalError("Could not find view controller with name \(self.nameOfClass)")
            }
       
            return viewController
        }
}


//struct User:Codable {
//    var firstName:String?
//    var latstName:String?
//    var officeCode:String?
//    var email:String?
//    var phoneNumber:String?
//}

struct ScreenSize{
    ///Width: *Screen width*
    static let Width = UIScreen.main.bounds.width
    ///Height: *Screen Height*
    static let Height = UIScreen.main.bounds.height

}

/// Video File Type
let VIDEO_FILE_EXTENSION = "mp4"
/// google client Id
let Google_Client_Id = "422281885025-njtq97gjrtecs6pmsl6v8gm2b2voesgn.apps.googleusercontent.com" //"422281885025-njtq97gjrtecs6pmsl6v8gm2b2voesgn.apps.googleusercontent.com" //"422281885025-k504vebtf96njj54msavanruae9jvhav.apps.googleusercontent.com"

extension UIViewController {
    func alertGlobly(message: String, title: String ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
