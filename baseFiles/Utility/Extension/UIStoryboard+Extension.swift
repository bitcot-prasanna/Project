//
//  UIStoryboard+Extension.swift
//  Aflog
//
//  Created by MNS on 22/05/20.
//  Copyright © 2020 Aflog. All rights reserved.
//

import UIKit

extension UIStoryboard {
    //  If there are multiple storyboards in the project, each one must be named here:
    enum Storyboard: String {
        case main  = "Main"
        case home = "Home"
        case sideMenu = "SideMenu"
        case login  = "Login"
        case report  = "Report"
        case communityDetail = "Communitydetail"
        case popUp = "PopUp"
        case profile  = "profile"
        case explore  = "Explore"
        case news = "News"
        case comment = "Comment"
        case editProfile = "EditProfile"
        case verification = "Verification"
        case userProfile = "UserProfile"
        case locationPicker = "LocationPicker"
        case editVideo = "EditVideo"
     }
    
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }
    
//    class func storyboard(storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
//        return UIStoryboard(name: storyboard.rawValue, bundle: bundle)
//    }
//    
//    func instantiateViewController<T: UIViewController>() -> T {
//        guard let viewController = instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
//            fatalError("Could not find view controller with name \(T.storyboardIdentifier)")
//        }
//        
//        return viewController
//    }
}
