//
//  String+Extension.swift
//  Aflog
//
//  Created by MNS on 08/06/20.
//  Copyright © 2020 Aflog. All rights reserved.
//

import UIKit
import CommonCrypto

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    var isValidEmail: Bool {
        let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let testEmail = NSPredicate(format:"SELF MATCHES %@", regularExpressionForEmail)
        return testEmail.evaluate(with: self)
        
    }
    
    var isValidURL: Bool {
        let regEx = "(https?://(?:www\\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\\.[^\\s]{2,}|https?://(?:www\\.|(?!www))[a-zA-Z0-9]+\\.[^\\s]{2,})"
        let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[regEx])
        return predicate.evaluate(with: self)
    }
    
    var isValidPhoneNumber: Bool {
        let regEx = "(\\+\\d{1,3}[- ]?)?\\d{10}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        let result =  predicate.evaluate(with: self)
        return result
    }
    
    
    
    var isPhoneNumberValid: Bool {
           do {
               let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
               let matches = detector.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
               if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count && self.count == 10
               } else {
                   return false
               }
           } catch {
               return false
           }
       }
    
    
    var isValidPassword: Bool {
        let password = self.trimmingCharacters(in: CharacterSet.whitespaces)
        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return passwordCheck.evaluate(with: password)
    }
    
    //Rage Exameple of text
//    ^                         Start anchor
//    (?=.*[A-Z].*[A-Z])        Ensure string has one uppercase letters.
//    (?=.*[!@#$&*])            Ensure string has one special case letter.
//    (?=.*[0-9].*[0-9])        Ensure string has one digits.
//    (?=.*[a-z].*[a-z].*[a-z]) Ensure string has one lowercase letters.
//    .{8}                      Ensure string is of length 8.
//    $                         End anchor.

    var containsOnlyAlphabets: Bool {
        return !isEmpty && range(of: "[^a-zA-Z ]", options: .regularExpression) == nil
    }
    
    var hasValidUsernameCharacters: Bool {
        return !isEmpty && range(of: "[^a-z0-9._]", options: .regularExpression) == nil
    }
    
    var md5: String {
        let data = Data(self.utf8)
        
        let hash = data.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) -> [UInt8] in
            var hash: [UInt8] = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
            CC_MD5(bytes.baseAddress, CC_LONG(data.count), &hash)
            return hash
        }
        
        return hash.map { String(format: "%02x", $0) }.joined()
    }
    
    func add(urlString: String) -> String {
        return (self + urlString)
    }
    
    
    func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            guard let date = dateFormatter.date(from: self) else {
                //return Date()
              //  preconditionFailure("Take a look to your format")
               // return Date()
                print("No date found")
                return nil
            }
            return date
        }
}


