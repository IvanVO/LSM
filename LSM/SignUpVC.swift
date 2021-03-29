//
//  SignUpVC.swift
//  LSM
//
//  Created by Ivan Villanueva on 16/02/21.
//  Copyright © 2021 Ivan Villanueva. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Create the bottom lines for the text fields
        let fullNameBottomLine = CALayer()
        let emailBottomLine = CALayer()
        let ageBottomLine = CALayer()
        let passwordBottomLine = CALayer()
        let confirmPasswordBottomLine = CALayer()
        
        // Full Name Text Field
        fullNameBottomLine.frame = CGRect(x: 0, y: fullNameTextField.frame.height - 2, width: fullNameTextField.frame.width, height: 2)
        
        fullNameBottomLine.backgroundColor = UIColor.init(red: 182, green: 113, blue: 113, alpha: 1).cgColor
        
        // Email Text Field
        emailBottomLine.frame = CGRect(x: 0, y: emailTextField.frame.height - 2, width: emailTextField.frame.width, height: 2)
        
        emailBottomLine.backgroundColor = UIColor.init(red: 182, green: 113, blue: 113, alpha: 1).cgColor

        // Age Text Field
        ageBottomLine.frame = CGRect(x: 0, y: ageTextField.frame.height - 2, width: ageTextField.frame.width, height: 2)
        
        ageBottomLine.backgroundColor = UIColor.init(red: 182, green: 113, blue: 113, alpha: 1).cgColor

        // Password Text Field
        passwordBottomLine.frame = CGRect(x: 0, y: passwordTextField.frame.height - 2, width: passwordTextField.frame.width, height: 2)
        
        passwordBottomLine.backgroundColor = UIColor.init(red: 182, green: 113, blue: 113, alpha: 1).cgColor

        // Confirm Password Field
        confirmPasswordBottomLine.frame = CGRect(x: 0, y: confirmPasswordTextField.frame.height - 2, width: confirmPasswordTextField.frame.width, height: 2)
        
        confirmPasswordBottomLine.backgroundColor = UIColor.init(red: 182, green: 113, blue: 113, alpha: 1).cgColor

        // Remove border on text field
        fullNameTextField.borderStyle = .none
        emailTextField.borderStyle = .none
        ageTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        confirmPasswordTextField.borderStyle = .none
        
        // Text Fields placeholders
        fullNameTextField.attributedPlaceholder = NSAttributedString(string: "Nombre Completo", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        ageTextField.attributedPlaceholder = NSAttributedString(string: "Edad", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Contraseña", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        confirmPasswordTextField.attributedPlaceholder = NSAttributedString(string: "Confirmar contraseña", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        // Add the line to the text field
        fullNameTextField.layer.addSublayer(fullNameBottomLine)
        emailTextField.layer.addSublayer(emailBottomLine)
        ageTextField.layer.addSublayer(ageBottomLine)
        passwordTextField.layer.addSublayer(passwordBottomLine)
        confirmPasswordTextField.layer.addSublayer(confirmPasswordBottomLine)
        
    }
    
    
    @IBAction func backToLogInBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
