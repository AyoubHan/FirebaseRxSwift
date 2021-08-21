//
//  HomeViewController.swift
//  FirebaseRxSwift
//
//  Created by AyoubHan on 20/08/2021.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backTapped(_ sender: UIButton) {
        let startViewController = storyboard?.instantiateViewController(identifier: "startVC") as? StartViewController
        view.window?.rootViewController = startViewController
        view.window?.makeKeyAndVisible()
    }
}
