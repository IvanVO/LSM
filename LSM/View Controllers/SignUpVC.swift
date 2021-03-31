//
//  SignUpVC.swift
//  LSM
//
//  Created by Ivan Villanueva on 16/02/21.
//  Copyright © 2021 Ivan Villanueva. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpVC: UIViewController {
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    func setUpUI() {
        
        errorLabel.alpha = 0
        
        UIUtilities.styleTextField(fullNameTextField)
        UIUtilities.styleTextField(emailTextField)
        UIUtilities.styleTextField(ageTextField)
        UIUtilities.styleTextField(passwordTextField)
        UIUtilities.styleTextField(confirmPasswordTextField)
    }
    
    /*
     * Check the fields and validate that the data is correct.
     * If everything is correct return nil. Otherwise, return the error message.
     */
    func validateFields() -> String? {
        // Check that all the fileds are field in.
        if fullNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            ageTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            confirmPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Favor de llenar ingresar todos los datos"
        }
        
        // Check if the password is secure
        let cleanedPassword1 = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanedPassword2 = confirmPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if cleanedPassword1 == cleanedPassword2 {
            if UIUtilities.isPasswordValid(cleanedPassword1!) == false && UIUtilities.isPasswordValid(cleanedPassword2!) == false {
                // Password isn't secure enough
                return "La contraseña debe tener 8 caracteres mínimo, debe contener un caracter especial y un número."
            }
        }
        else {
            
            return "Asegurese de que ambas contraseñas sean las mismas."
        }
        
        return nil
    }
    
    
    @IBAction func registerNewAccount(_ sender: Any) {
        
        // Validate the fields.
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        }
        else {
            
            // Create clean versions of the data entered by the user
            let fullName = fullNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let age = ageTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                
                if error != nil {
                    self.showError("An error occured while creating the user.")
                }
                else {
                    // Reference to the data base.
                    let db = Firestore.firestore()
                    
                    // User was successfully created, now store extra fields in the database
                    db.collection("users").addDocument(data: ["fullname":fullName, "age":age, "gender":self.genderSegmentedControl.selectedSegmentIndex, "userId":result!.user.uid]) { (result) in
                        if error != nil {
                            self.showError("An error occured while saving the data.")
                        }
                    }
                    // Sign me in after saving the data.
                    self.takeMeToTheHomeScreen()
                }
            }
        }
    }
    
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func takeMeToTheHomeScreen(){
        let vc = self.storyboard?.instantiateViewController(identifier: "UITabBarController") as! UITabBarController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func backToLogInBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "SignInVC") as! SignInVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
