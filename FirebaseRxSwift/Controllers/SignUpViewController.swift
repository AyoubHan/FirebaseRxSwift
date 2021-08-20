//
//  SignUpViewController.swift
//  FirebaseRxSwift
//
//  Created by AyoubHan on 20/08/2021.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        setErrorLabel()
        securePasswordEntry()
    }
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        let error = fieldsCheck()
        
        if error != nil {
            showError(error ?? "")
        } else {
            let firstName = firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            let lastName = lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if error != nil {
                    self.showError("could not create user")
                } else {
                    let dataBase = Firestore.firestore()
                    dataBase.collection("users").addDocument(data: ["firstname" : firstName, "lastname": lastName, "uid": result!.user.uid]) { (error) in
                        if error != nil {
                            self.showError("User's data could not be synced with our database, please retry in a moment")
                        }
                    }
                    
                    // TODO: Transition to home view controller
                }
            }
        }
    }
    
    private func setButton() {
        ButtonStyles.styleButton(signUpButton)
    }
    
    private func setErrorLabel() {
        errorLabel.isHidden = true
    }
    
    private func securePasswordEntry() {
        passwordTextField.isSecureTextEntry = true
    }
    
    private func fieldsCheck() -> String? {
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all the text fields"
        }
        
        //TODO: Password check
        
        return nil
    }
    
    private func showError(_ message: String) {
        errorLabel.isHidden = false
        errorLabel.textColor = .red
    }
}
