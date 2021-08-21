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
                    self.transitionToHome()
                }
            }
        }
    }
    
    private func setUpLabel() {
        errorLabel.isHidden = true
    }
    
    private func transitionToHome() {
        let homeVC = storyboard?.instantiateViewController(identifier: Storyboard.homeVC) as? HomeViewController
        view?.window?.rootViewController = homeVC
        view?.window?.makeKeyAndVisible()
    }

    private func setButton() {
        ButtonStyles.styleButton(signInButton)
    }
    
    private func fieldsCheck() -> String? {
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all the text fields"
        }
        
        let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        if Password.isSecure(password) == false {
            return "Please make sure your password is at least 8 characters long, contains one special character and one number"
        }
        return nil
    }
    
    private func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
        errorLabel.textColor = .orange
        errorLabel.alpha = 0.65
        errorLabel.layer.cornerRadius = 15.0
    }

}
