//
//  UIUtilities.swift
//  LSM
//
//  Created by Ivan Villanueva on 29/03/21.
//  Copyright © 2021 Ivan Villanueva. All rights reserved.
//

import Foundation
import UIKit

class UIUtilities {
    // styling of text fields.
    static func styleTextField(_ textField:UITextField) {
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 2, width: textField.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
        // Remove border on text field
        textField.borderStyle = .none
        
        // Add the line to the text field
        textField.layer.addSublayer(bottomLine)
    }
    
    // Creating an alert notification to disaply errors.
    static func errorAlertNotification(title:String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
     
        alert.addAction(alertAction)
        
        alert.present(alert, animated: true, completion: nil)
    }
    
    // Specifying the parameters that a password has to meet so it is considered valid.
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
}
