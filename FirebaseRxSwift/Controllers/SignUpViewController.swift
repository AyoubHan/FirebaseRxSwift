//
//  SignUpViewController.swift
//  FirebaseRxSwift
//
//  Created by AyoubHan on 20/08/2021.
//

import UIKit

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
        securePasswordEntry()
    }
    
    private func setButton() {
        ButtonStyles.styleButton(signUpButton)
    }
    
    private func securePasswordEntry() {
        passwordTextField.isSecureTextEntry = true
    }
}
