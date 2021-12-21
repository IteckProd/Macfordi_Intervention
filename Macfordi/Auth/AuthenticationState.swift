//
//  AuthenticationState.swift
//  Only Green
//
//  Created by Louis Jeanty on 12/10/2021.
//  Copyright © 2021 Only Vert. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import AuthenticationServices
import CryptoKit
import FirebaseAuth

enum LoginOption {
    case emailAndPassword(email: String, password: String)
}

class AuthenticationState: NSObject, ObservableObject {

    @Published var loggedInUser: User?
    @Published var isAuthenticating = false
    @Published var error: NSError?
    

    static let shared = AuthenticationState()

    private let auth = Auth.auth()
    
    override private init() {
        super.init()
        loggedInUser = auth.currentUser
        auth.addStateDidChangeListener(authStateChanged)
        
    }
    
    private func authStateChanged(with auth: Auth, user: User?) {
        guard user != self.loggedInUser else { return }
        self.loggedInUser = user
    }

    func login(with loginOption: LoginOption) {
        self.isAuthenticating = true
        self.error = nil

        switch loginOption {
            case let .emailAndPassword(email, password):
                handleSignInWith(email: email, password: password)
        }
    }

    func signup(email: String, password: String, passwordConfirmation: String) {
        guard password == passwordConfirmation else {
            self.error = NSError(domain: "", code: 9210, userInfo: [NSLocalizedDescriptionKey: "Le mot de passe n'est pas identique"])
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            //TODO: SwiftMessage error
            if let error = error as NSError? {
                switch AuthErrorCode(rawValue: error.code) {
                case .operationNotAllowed: break
                    // Error: The given sign-in provider is disabled for this Firebase project. Enable it in the Firebase console, under the sign-in method tab of the Auth section.
                case .emailAlreadyInUse: break
                    // Error: The email address is already in use by another account.
                case .invalidEmail: break
                    // Error: The email address is badly formatted.
                case .weakPassword: break
                    // Error: The password must be 6 characters long or more.
                default:
                    print("Error: \(error.localizedDescription)")
                }
            } else {
                print("User signs up successfully")
            }
        }
    }
    
    private func handleSignInWith(email: String, password: String) {
        auth.signIn(withEmail: email, password: password, completion: handleAuthResultCompletion)
    }
    
    private func handleAuthResultCompletion(auth: AuthDataResult?, error: Error?) {
        DispatchQueue.main.async {
            self.isAuthenticating = false
            if let user = auth?.user {
                self.loggedInUser = user
            } else if let error = error {
                self.error = error as NSError
            }
        }
    }
  
    func signout() {
        try? auth.signOut()
    }
}
