//
//  SettingsVC.swift
//  LSM
//
//  Created by Ivan Villanueva on 17/02/21.
//  Copyright © 2021 Ivan Villanueva. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let emailBottomLine = CALayer()
        let passwordBottomLine = CALayer()
        let confirmPasswordBottomLine = CALayer()
        
        
        // Email Text Field
        emailBottomLine.frame = CGRect(x: 0, y: emailTextField.frame.height - 2, width: emailTextField.frame.width, height: 2)
        
        emailBottomLine.backgroundColor = UIColor.init(red: 182, green: 113, blue: 113, alpha: 1).cgColor

        // Password Text Field
        passwordBottomLine.frame = CGRect(x: 0, y: passwordTextField.frame.height - 2, width: passwordTextField.frame.width, height: 2)
        
        passwordBottomLine.backgroundColor = UIColor.init(red: 182, green: 113, blue: 113, alpha: 1).cgColor
        

        // Confirm Password Field
        confirmPasswordBottomLine.frame = CGRect(x: 0, y: confirmPasswordTextField.frame.height - 2, width: confirmPasswordTextField.frame.width, height: 2)
        
        confirmPasswordBottomLine.backgroundColor = UIColor.init(red: 182, green: 113, blue: 113, alpha: 1).cgColor
        
        
        // Remove border on the text field
        emailTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        confirmPasswordTextField.borderStyle = .none
        
        // Text Field placeholders
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Contraseña", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        confirmPasswordTextField.attributedPlaceholder = NSAttributedString(string: "Confirmar contraseña", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        // Add the line to the text field
        emailTextField.layer.addSublayer(emailBottomLine)
        passwordTextField.layer.addSublayer(passwordBottomLine)
        confirmPasswordTextField.layer.addSublayer(confirmPasswordBottomLine)
        
    }
}
