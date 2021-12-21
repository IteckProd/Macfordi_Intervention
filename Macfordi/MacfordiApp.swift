//
//  MacfordiApp.swift
//  Macfordi
//
//  Created by Louis Jeanty on 08/12/2021.
//

import SwiftUI
import Firebase

@main
struct MacfordiApp: App {
    
    init() {
        FirebaseApp.configure()
        SettingFirestore()
    }
    
    var body: some Scene {
        let authState = AuthenticationState.shared
        
        WindowGroup {
            ContentView()
                .environmentObject(authState)
                .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
        }
    }
    
    func SettingFirestore() {
        let setting = FirestoreSettings()
        setting.isPersistenceEnabled = true
        setting.cacheSizeBytes = FirestoreCacheSizeUnlimited
        Firestore.firestore().settings = setting
    }
}

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func addTapGestureRecognizer() {
        guard let window = windows.first else { return }
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        window.addGestureRecognizer(tapGesture)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true // set to `false` if you don't want to detect tap during other gestures
    }
}
