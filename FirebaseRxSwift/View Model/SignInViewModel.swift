//
//  SignInViewModel.swift
//  FirebaseRxSwift
//
//  Created by AyoubHan on 22/08/2021.
//

import Foundation
import RxSwift

class SignInViewModel {
    
    // MARK: Properties
    
     let emailPublisher = PublishSubject<String>()
     let passwordPublisher = PublishSubject<String>()
    
    // MARK: Methods
    
    func isConform() -> Observable<Bool> {
        return Observable.combineLatest(emailPublisher.asObservable().startWith(""), passwordPublisher.asObservable().startWith("")).map { email, password in
            return !email.isEmpty && email.contains("@") && !password.isEmpty && password.count >= 8
        }.startWith(false)
    }
}
