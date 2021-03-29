//
//  ViewController.swift
//  LSM
//
//  Created by Ivan Villanueva on 15/02/21.
//  Copyright © 2021 Ivan Villanueva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
        
        // Create the bottom line
        let emailBottomLine = CALayer()
        let passwordBottomLine = CALayer()
        
        emailBottomLine.frame = CGRect(x: 0, y: emailTextField.frame.height - 2, width: emailTextField.frame.width, height: 2)
        
        emailBottomLine.backgroundColor = UIColor.init(red: 98, green: 146, blue: 154, alpha: 1).cgColor
        
        passwordBottomLine.frame = CGRect(x: 0, y: emailTextField.frame.height - 2, width: emailTextField.frame.width, height: 2)
        
        passwordBottomLine.backgroundColor = UIColor.init(red: 98, green: 146, blue: 154, alpha: 1).cgColor
        
        // Remove border on text field
        emailTextField.borderStyle = .none
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        
        passwordTextField.borderStyle = .none
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Contraseña",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        // Add the line to the text field
        emailTextField.layer.addSublayer(emailBottomLine)
        
        passwordTextField.layer.addSublayer(passwordBottomLine)
        
    }
    

    @IBAction func presentSignUpVC(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "SignUpVC") as! SignUpVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func presentLogInVC(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "UITabBarController") as! UITabBarController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

