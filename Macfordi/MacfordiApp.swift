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
    let authState = AuthenticationState.shared
    
    init() {
        FirebaseApp.configure()
        SettingFirestore()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authState)
        }
    }
    
    func SettingFirestore() {
        let setting = FirestoreSettings()
        setting.isPersistenceEnabled = true
        setting.cacheSizeBytes = FirestoreCacheSizeUnlimited
        Firestore.firestore().settings = setting
    }
}
