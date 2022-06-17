//
//  UIViewController+Extension.swift
//  PickPic
//
//  Created by Tarun Sahu on 27/02/21.
//

import Foundation
import UIKit
//import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
extension UIViewController{
    func getRandomNumber(from:Int,to:Int) -> Int {
        return Int.random(in: from..<to)
    }
    
    func setCommonTextField(tf:MDCFilledTextField,title:String)->MDCFilledTextField {
        let newColor = UIColor(red: 242/255.0, green: 110/255.0, blue: 19/255.0, alpha: 1.0)
        let newGrayColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1.0)
        let tfBackgroundColor = UIColor(red: 45/255.0, green: 45/255.0, blue: 45/255.0, alpha: 1.0)
        tf.label.text = title
        tf.setFloatingLabelColor(newGrayColor, for: .normal)
        tf.setTextColor(.white, for: .normal)
        tf.setUnderlineColor(newColor, for: .editing)
        tf.setUnderlineColor(newGrayColor, for: .normal)
        tf.tintColor = newColor
        tf.setTextColor(.white, for: .editing)
        tf.setFilledBackgroundColor(tfBackgroundColor, for: .normal)
        tf.setFilledBackgroundColor(tfBackgroundColor, for: .editing)
        tf.setFloatingLabelColor(newColor, for: .editing)
        tf.setNormalLabelColor(newGrayColor, for: .normal)
        return tf
    }
    
}

