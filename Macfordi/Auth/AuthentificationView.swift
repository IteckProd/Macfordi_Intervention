//
//  AuthentificationView.swift
//  Macfordi
//
//  Created by Louis Jeanty on 08/12/2021.
//

import SwiftUI

struct AuthentificationView: View {
    
    enum AuthenticationType: String {
        case login
        case signup
        
        var text: String {
            rawValue.capitalized
        }
        
        var assetBackgroundName: String {
            self == .login ? "Créer un compte" : "Se connecter"
        }
        
        var buttonText: String {
            switch self {
            case .login:
                return "C'est parti !"
                
            case .signup:
                return "J'ai déjà un compte"
            }
        }
    }
    
    @EnvironmentObject var authState: AuthenticationState
    @State var authType = AuthenticationType.signup
    
    @State var mail = ""
    @State var password = ""
    @State var passwordConf = ""
    
    var body: some View {
        VStack {
            TextField("Adresse Email", text: $mail)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .underlineTextField()
            
            if authType == .signup {
                SecureField("Confirmation", text: $passwordConf)
                    .underlineTextField()
            } else {
                HStack {
                    Spacer()
                    Text("Mot de passe oublié ?").font(.system(size: 14, weight: .medium)).foregroundColor(Colors.Enable)
                }.padding(.bottom, 35)
            }
        }
    }
}

struct AuthentificationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthentificationView()
    }
}
