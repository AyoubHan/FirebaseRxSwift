//
//  SignInViewController.swift
//  FirebaseRxSwift
//
//  Created by AyoubHan on 20/08/2021.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        securePasswordEntry()
    }
    

    private func setButton() {
        ButtonStyles.styleButton(signInButton)
    }
    
    private func securePasswordEntry() {
        passwordTextField.isSecureTextEntry = true
    }

}
