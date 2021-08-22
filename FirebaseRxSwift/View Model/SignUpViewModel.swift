//
//  SignUpViewModel.swift
//  FirebaseRxSwift
//
//  Created by AyoubHan on 22/08/2021.
//

import Foundation
import RxSwift

class SignUpViewModel {
    
    // MARK: Properties
    
    let emailPublisher = PublishSubject<String>()
    let passwordPublisher = PublishSubject<String>()
    let firstnamePublisher = PublishSubject<String>()
    let lastnamePublisher = PublishSubject<String>()
    
    // MARK: Methods
    
    func isConform() -> Observable<Bool> {
        return Observable.combineLatest(firstnamePublisher.asObservable().startWith(""), lastnamePublisher.asObservable().startWith(""), emailPublisher.asObservable().startWith(""), passwordPublisher.asObservable().startWith("")).map { fname, lname, email, password in
            return !email.isEmpty && email.contains("@") && !password.isEmpty && password.count >= 8 && !fname.isEmpty && fname.count >= 3 && !lname.isEmpty && lname.count >= 3
        }.startWith(false)
    }
}
