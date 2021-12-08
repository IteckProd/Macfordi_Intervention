//
//  ContentView.swift
//  Macfordi
//
//  Created by Louis Jeanty on 08/12/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authState: AuthenticationState
    
    var body: some View {
        if authState.loggedInUser != nil {
            //mainTabView
        } else {
            //AuthView
        }
    }
}
