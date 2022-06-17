//
//  ApplicationPreference.swift
//  MyPanditJi
//

import Foundation

class ApplicationPreference{
    
    fileprivate static let defaults = UserDefaults.standard
    
    //////////////// Remove all info //////
    class func clearAllData(){
        defaults.removeObject(forKey: Key.UserDefaults.k_App_UserLoginInfoKey)
        defaults.removeObject(forKey: Key.UserDefaults.k_App_UserTokenKey)
        defaults.removeObject(forKey: Key.UserDefaults.k_APP_UserNext)
        //
    }
    
    class func clearImageData(){
        defaults.removeObject(forKey: Key.UserDefaults.k_App_UserImageKey)
    }
    class func clearSpalsh(){
        defaults.removeObject(forKey: Key.UserDefaults.k_App_Splash)
    }
    
    class func clearCartCount(){
        defaults.removeObject(forKey: Key.UserDefaults.k_App_CartCount)
    }

    //////////////// Remove all info //////
    class func clearAddress(){
        defaults.removeObject(forKey: Key.UserDefaults.k_App_UserSddress)
    }
    
//    /////////////// GET & SAVE User Data //////
//    class func saveUserLoginInfo(loginData: User?){
//        let encoder = JSONEncoder()
//        if let encoded = try? encoder.encode(loginData) {
//            defaults.set(encoded, forKey: Key.UserDefaults.k_App_UserLoginInfoKey)
//        }
//
//        UserDefaults.standard.synchronize()
//    }
//
//
//    class func getUserLoginInfo()->User?{
//
//      if let savedDetails = defaults.object(forKey: Key.UserDefaults.k_App_UserLoginInfoKey) as? Data {
//          let decoder = JSONDecoder()
//          if let loadedPerson = try? decoder.decode(User.self, from: savedDetails) {
//              return loadedPerson
//          }else{
//              return nil
//          }
//      }else{
//          return nil
//      }
//   }

     class func getUserLoginId()->String{
         let loginData = defaults.object(forKey:Key.UserDefaults.k_App_UserLoginInfoKey) as? NSDictionary
         return  loginData?["uId"] as? String ?? ""
     }
     
     
    class func getUserId1()->String{
        let loginData = defaults.object(forKey:Key.UserDefaults.k_App_UserId1) as? NSDictionary
        return  loginData?["uId"] as? String ?? ""
    }
     
    
    
     
     ///////////////// GET & SAVE Payment Token //////
     class func savePaymentToken(tokenString: String){
         defaults.set(tokenString, forKey: Key.UserDefaults.k_App_PaymentTokenKey)
         UserDefaults.standard.synchronize()
     }
     
     class func getPaymentToken()->String?{
         let token = defaults.object(forKey: Key.UserDefaults.k_App_PaymentTokenKey)
         if token == nil{
             return ""
         }else{
             return (token as! String)
         }
     }
    
    /////////////// GET & SAVE VenderId //////
    class func getVenderId()->Int?{
        let token = defaults.object(forKey: Key.UserDefaults.k_App_VenderId)
        if token == nil{
            return nil
        }else{
            return (token as! Int)
        }
    }
    class func saveVenderId(VenderId: Int?){
            defaults.set(VenderId, forKey: Key.UserDefaults.k_App_VenderId)
        UserDefaults.standard.synchronize()
    }
    
    /////////////// GET & SAVE notificatiocount//////
    class func getNotificationCount()->Int?{
        let token = defaults.object(forKey: Key.UserDefaults.k_App_NotificationCount)
        if token == nil{
            return nil
        }else{
            return (token as! Int)
        }
    }
    class func saveNotificationCount(NotificationCount: Int?){
            defaults.set(NotificationCount, forKey: Key.UserDefaults.k_App_NotificationCount)
        UserDefaults.standard.synchronize()
    }
    
    

    /////////////// GET & SAVE VenderId //////
    class func getCategoryId()->Int?{
        let token = defaults.object(forKey: Key.UserDefaults.k_App_CategoryId)
        if token == nil{
            return nil
        }else{
            return (token as! Int)
        }
    }
    
    class func saveCategoryId(CategoryId: Int?){
            defaults.set(CategoryId, forKey: Key.UserDefaults.k_App_CategoryId)
        UserDefaults.standard.synchronize()
    }

    
    
    /////////////// GET & SAVE CartCount //////
       class func getCartCount()->String?{
        let token = defaults.object(forKey: Key.UserDefaults.k_App_CartCount)
           if token == nil{
               return nil
           }else{
               return (token as! String)
           }
       }
       class func saveCartCount(CartCount: String?){
               defaults.set(CartCount, forKey: Key.UserDefaults.k_App_CartCount)
           UserDefaults.standard.synchronize()
       }
    
//    /////////////// GET & SAVE User Data //////
//    class func saveAddressInfo(loginData: AddressInfo?){
//        let encoder = JSONEncoder()
//        if let encoded = try? encoder.encode(loginData) {
//            defaults.set(encoded, forKey: Key.UserDefaults.k_App_UserSddress)
//        }
//
//        UserDefaults.standard.synchronize()
//    }
//     
//   class func getAddressInfo()->AddressInfo?{
//      if let savedDetails = defaults.object(forKey: Key.UserDefaults.k_App_UserSddress) as? Data {
//          let decoder = JSONDecoder()
//          if let loadedPerson = try? decoder.decode(AddressInfo.self, from: savedDetails) {
//              return loadedPerson
//          }else{
//              return nil
//          }
//      }else{
//          return nil
//      }
//   }

    
    //RDX
  
    //// save a flag
    
    class func saveSkip(skipString: String){
        defaults.set(skipString, forKey: Key.UserDefaults.k_App_SkipIntrest)
        UserDefaults.standard.synchronize()
    }
   
    
    class func getskip()->String?{
        let skip = defaults.object(forKey:Key.UserDefaults.k_App_SkipIntrest)
        if skip == nil{
            return nil
        }else{
            return (skip as! String)
        }
    }
    
    class func savenext(nextString: String){
        defaults.set(nextString, forKey: Key.UserDefaults.k_APP_UserNext)
        UserDefaults.standard.synchronize()
    }
    
    class func getNext()->String?{
        let next = defaults.object(forKey:Key.UserDefaults.k_APP_UserNext)
        if next == nil{
            return nil
        }else{
            return (next as! String)
        }
    }
    
    class func saveSplash(nextString: String){
        defaults.set(nextString, forKey: Key.UserDefaults.k_App_Splash)
        UserDefaults.standard.synchronize()
    }
    
    class func getSpalsh()->String?{
        let next = defaults.object(forKey:Key.UserDefaults.k_App_Splash)
        if next == nil{
            return nil
        }else{
            return (next as! String)
        }
    }
    
    
    ///////////////// GET & SAVE Token //////
    class func saveUserToken(tokenString: String){
        defaults.set(tokenString, forKey: Key.UserDefaults.k_App_UserTokenKey)
        UserDefaults.standard.synchronize()
    }
   
    
    class func getUserToken()->String?{
        let token = defaults.object(forKey:Key.UserDefaults.k_App_UserTokenKey)
        if token == nil{
            return nil
        }else{
            return (token as! String)
        }
    }
    
    
    ///////////////// GET & SAVE Image //////
    
    class func saveUserImage(imageString: String){
        defaults.set(imageString, forKey: Key.UserDefaults.k_App_UserImageKey)
        UserDefaults.standard.synchronize()
    }
    
    class func getUserImage()->String?{
        let image = defaults.object(forKey:Key.UserDefaults.k_App_UserImageKey)
        if image == nil{
            return nil
        }else{
            return (image as! String)
        }
    }
    
    
    ///////////////// GET & SAVE language //////
    
    class func saveArrLang(tokenString: [String]){
        defaults.set(tokenString, forKey: Key.UserDefaults.k_App_arrLang)
        UserDefaults.standard.synchronize()
    }
   
    
    class func getArrLang()->[String]?{
        let token = defaults.object(forKey:Key.UserDefaults.k_App_arrLang)
        if token == nil{
            return nil
        }else{
            return (token as! [String])
        }
    }
}
