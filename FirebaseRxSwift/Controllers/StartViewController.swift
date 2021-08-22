//
//  StartViewController.swift
//  FirebaseRxSwift
//
//  Created by AyoubHan on 20/08/2021.
//

import UIKit

class StartViewController: UIViewController {
    
    // MARK: @IBOutlets

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtons()
    }
    
    // MARK: Private Methods
    
    private func setUpButtons() {
        ButtonStyles.styleButton(signInButton)
        ButtonStyles.styleButton(signUpButton)
    }
}
