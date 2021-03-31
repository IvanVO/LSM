//
//  ViewController.swift
//  LSM
//
//  Created by Ivan Villanueva on 15/02/21.
//  Copyright © 2021 Ivan Villanueva. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
        
        setUpUI()
    }
    
    func setUpUI() {
        errorLabel.alpha = 0
        
        UIUtilities.styleTextField(emailTextField)
        UIUtilities.styleTextField(passwordTextField)
    }
    

    @IBAction func presentSignUpVC(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "SignUpVC") as! SignUpVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func validateFields() -> String? {
        // Check that all the fields are filled in
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Favor de ingresar el correo y la contraseña."
        }
        
        return nil
    }
    
    /*
     * TODO: Implement the function @IBAction func forgotPassword(_ sender: Any){...}
    */
    
    
    @IBAction func presentLogInVC(_ sender: Any) {
        
        // Validate text fields.
        let error = validateFields()
        
        if error != nil {
            print("There is something wrong in the Log in fields.")
        }
        
        // Create cleaned versions of the text field's data.
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Sign in the user.
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            // Check for errors
            if error != nil {
                // Couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                // Send user to the home screen
                
                let vc = self.storyboard?.instantiateViewController(identifier: "UITabBarController") as! UITabBarController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
