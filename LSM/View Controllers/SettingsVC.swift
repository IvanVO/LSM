//
//  SettingsVC.swift
//  LSM
//
//  Created by Ivan Villanueva on 30/03/21.
//  Copyright © 2021 Ivan Villanueva. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SettingsVC: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userAgeLabel: UILabel!
    @IBOutlet weak var userGenderLabel: UILabel!
    
    @IBOutlet weak var updateEmail: UITextField!
    @IBOutlet weak var updatePassword: UITextField!
    @IBOutlet weak var confirmNewPassword: UITextField!
    
    private let db = Firestore.firestore()
    private let user = Auth.auth().currentUser
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpUI()
        showUserData()
    }
    
    private func setUpUI() {
        UIUtilities.styleTextField(updateEmail)
        UIUtilities.styleTextField(updatePassword)
        UIUtilities.styleTextField(confirmNewPassword)
    }
    
    private func showUserData() {
        
        // Check if user is signed in.
        if let user = user {
            // Get user's information
            db.collection("users").whereField("userId", isEqualTo: user.uid).getDocuments() { (querySnapshot, error) in
                // Check for errors.
                if let error = error {
                    print("Error getting documents \(error)")
                }
                else {
                    self.updateEmail.text! = user.email!
                    for document in querySnapshot!.documents {
                        let userData = document.data()
                        print(userData)
                        
                        for (key, value) in userData {
                            if key == "fullname" {
                                self.userNameLabel.text! = value as! String
                                //print(value)
                            }
                            else if key == "age" {
                                self.userAgeLabel.text! = value as! String
                            }
                            else if key == "gender" {
                                switch value as! Int {
                                case 1:
                                    self.userGenderLabel.text! = "Mujer"
                                case 2:
                                    self.userGenderLabel.text! = "Otro"
                                default:
                                    self.userGenderLabel.text! = "Hombre"
                                } // switch
                            } // gender else if
                        } // for (key, value)
                    } // for document in ...
                } // else (there is no error)
            } // db.collection
        } // if user is signed in
        else {
            // No user is signed in
            print("No user is signed in")
        }
    }

    
    private func updateAlertMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
     
        alert.addAction(alertAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    private func validateEmail(currentUser user:User, dbEmail: String, emailTextField: String) {
        if emailTextField != "" && dbEmail != emailTextField {
         // Perform actions to update the user's email.
            user.updateEmail(to: emailTextField, completion: { (error) in
                if let error = error as NSError? {
                    // Display the corresponding error.
                    switch AuthErrorCode(rawValue: error.code) {
                    case .emailAlreadyInUse:
                        self.updateAlertMessage(title: "Error", message: "Este correo ya se encuentra registrado. Favor de usar otro")
                    case .invalidEmail:
                        self.updateAlertMessage(title: "Error", message: "Favor de ingresar un correo valido.")
                    default:
                        self.updateAlertMessage(title: "Error", message: error.localizedDescription)
                        //print(error.localizedDescription)
                    }
                }
                else {
                    print("Correo exitosamente actualizado")
                }
            })
        }
    }
    private func checkNewPassword(currentUser user:User, password1:String, password2: String) {
        // Create clean versions of the data entered by the user.
        let cleanedPassword_1 = password1.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanedPassword_2 = password2.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Check that both passwords match.
        if cleanedPassword_1 == cleanedPassword_2 {
            // Check that the password is valid.
            if UIUtilities.isPasswordValid(cleanedPassword_1) == false && UIUtilities.isPasswordValid(cleanedPassword_2) == false {
                // Password isn't secure enough.
                updateAlertMessage(title: "Contraseña debil", message: "La contraseña debe tener 8 caracteres mínimo, debe contener un caracter especial y un número.")
            }
            else {
                user.updatePassword(to: cleanedPassword_2, completion: nil)
                //updateAlertMessage(title: "Atención!!", message: "Favor ")
                print("Contraseña actualizada exitosamente.")
            }
        }
        else {
            updateAlertMessage(title: "Error", message: "Favor de verificar que ambas contraseñas sean iguales.")
        }
    }
    

    @IBAction func saveNewInformation(_ sender: Any) {
        // Check if user is signed in
        if let user = user {
            // Validate the Email
            validateEmail(currentUser:user, dbEmail:user.email!, emailTextField:self.updateEmail.text!)
            
            // Check the new password.
            checkNewPassword(currentUser: user, password1: updatePassword.text!, password2: confirmNewPassword.text!)
        }
        else {
            print("No user is signed in.")
        }
        
    }
    
    
    @IBAction func signOutBtn(_ sender: Any) {
        let alert = UIAlertController(title:"¿Cerrar sesión?", message: "Siempre puede acceder a tu cuenta volviendo a iniciar sesión", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Cerrar sesión", style: .destructive, handler: {(_: UIAlertAction) in
            do {
                try Auth.auth().signOut() // Sign user out
                // Present the Log in View Controller
                let vc = self.storyboard?.instantiateViewController(identifier: "SignInVC") as! SignInVC
                self.navigationController?.pushViewController(vc, animated: true)
                
                print("Session successfully closed")
                
            } catch let signOutError as NSError {
                print("Error al cerrar la sesión: \(signOutError)")
            }
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func deleteAccount(_ sender: Any) {
        // Check if user is signed in.
        if let user = user {
            
            let alert = UIAlertController(title: "¿Eliminar cuenta?", message: "Esta acción no es reversible. Presiona 'Eliminar Cuenta' para proceder o 'Cancelar' para abortar esta acción.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Canelar", style: .default, handler: nil))
            
            alert.addAction(UIAlertAction(title: "Eliminar Cuenta", style: .destructive, handler: {(_: UIAlertAction!) in
                user.delete(completion: nil)
                print("User's account successfully deleted.")
            }))
            
            present(alert, animated: true, completion: nil)
        }
    }
    
}
