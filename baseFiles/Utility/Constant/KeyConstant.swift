//
//  KeyConstant.swift
//  Urjas Departmental
//
//  Created by mac on 23/09/20.
//  Copyright © 2020 MPPKVVCL. All rights reserved.
//

import Foundation

//KeyConstants.swift

struct Key {
    
    static let DeviceType = "iOS"
    struct Beacon{
        static let ONEXUUID = "xxxx-xxxx-xxxx-xxxx"
    }
    
    struct UserDefaults {
        static let k_App_Running_FirstTime = "userRunningAppFirstTime"
        static let k_App_UserLoginInfoKey = "userLoginInfo"
        static let k_App_UserTokenKey = "userToken"
        static let k_App_UserImageKey = "userImage"
        static let k_App_PaymentTokenKey = "paymentToken"
        static let k_App_VenderId = "venderId"
        static let k_App_CategoryId = "categoryId"
        static let k_App_CartCount = "CartCount"
        static let k_App_NotificationCount = "NotificationCount"
        static let k_App_UserSddress = "userAddress"
        static let k_APP_UserNext = "next"
        static let k_App_UserId = "userId"
        static let k_App_UserId1 = "id"
        static let k_App_Splash = "Splash"

       //Rdx
        static let k_App_SkipIntrest = "Skip"
        static let k_App_arrLang = "arrLang"
        
        
        
    }
    
    struct Headers {
        static let Authorization = "Authorization"
        static let ContentType = "Content-Type"
    }
    
    struct Google{
        static let placesKey = "AIzaSyADtbx3B6-G8427Uo18r_EeYH9Gc65F4hw"
        static let serverKey = "some key here"
        static let mapKey = "AIzaSyCol4YKYrKzCqGMMCDymD_zHT3P-PCQ2sQ"
    }
    
    struct ErrorMessage{
        static let listNotFound = "ERROR_LIST_NOT_FOUND"
        static let validationError = "ERROR_VALIDATION"
    }
    
    struct CoreData{
        static let persistentContainer = "AddToCart"
        static let entityName = "Product"
    }
    
}

