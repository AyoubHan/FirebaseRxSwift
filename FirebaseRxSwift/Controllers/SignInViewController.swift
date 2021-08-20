//
//  SignInViewController.swift
//  FirebaseRxSwift
//
//  Created by AyoubHan on 20/08/2021.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        setUpLabel()
        securePasswordEntry()
    }
    
    
    @IBAction func signInTapped(_ sender: UIButton) {
        let error = fieldsCheck()
        
        if error != nil {
            showError(error ?? "")
        } else {
            let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
             let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if error != nil {
                    self.showError(error?.localizedDescription ?? "")
                } else {
                    //TODO: Transition to homeviewcontroller
                }
            }
        }
    }
    
    private func setUpLabel() {
        errorLabel.isHidden = true
    }

    private func setButton() {
        ButtonStyles.styleButton(signInButton)
    }
    
    private func securePasswordEntry() {
        passwordTextField.isSecureTextEntry = true
    }
    
    private func fieldsCheck() -> String? {
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all the text fields"
        }
        
        //TODO: Password check
        
        return nil
    }
    
    private func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
        errorLabel.textColor = .red
        errorLabel.alpha = 1
    }

}
