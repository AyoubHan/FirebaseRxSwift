//
//  Password.swift
//  FirebaseRxSwift
//
//  Created by AyoubHan on 21/08/2021.
//

import Foundation

class Password {
    
    static func isSecure(_ password: String) -> Bool {
        let securePassword = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return securePassword.evaluate(with: password)
    }
}
