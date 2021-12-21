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
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.white)
                VStack {
                    if authType == .login {
                        HStack {
                            Button(action: {
                                withAnimation {
                                    authType = .signup
                                }
                            }, label: {
                                BackButton(text: "Créer un compte")
                            })
                            Spacer()
                        }.padding(.bottom)
                    }
                    HStack {
                        Text(authType == .login ? "Connexion" : "Créer un compte")
                            .font(.system(size: 28, weight: .semibold))
                        Spacer()
                    }
                    Group {
                        //TextField
                        TextField("Adresse Email", text: $mail)
                            .textContentType(.emailAddress)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .underlineTextField()
                        SecureField("Mot de passe", text: $password)
                            .underlineTextField()
                        if authType == .signup {
                            SecureField("Confirmation", text: $passwordConf)
                                .underlineTextField()
                        } else {
                            HStack {
                                Text("Mot de passe oublié ?").font(.system(size: 14, weight: .medium)).foregroundColor(Colors.Enable)
                                Spacer()
                            }.padding(.bottom, 35).padding(.horizontal, 10)
                        }
                    }
                    Spacer()
                    HStack {
                        Button(action: {
                            emailAuthenticationTapped()
                        }, label: {
                            ButtonPrimary(text: "Continuer")
                        })
                    }
                    if authType == .signup {
                        Button(action: {
                            withAnimation {
                                authType = .login
                            }
                        }, label: {
                            ButtonThird(text: "J'ai déjà un compte")
                        })
                    }
                }.padding(.all).padding(.vertical)
            }
                .padding(.all)
                .frame(height: UIScreen.main.bounds.height/2)
            Spacer()
        }
        .background(Colors.Enable.ignoresSafeArea())
    }
    
    private func emailAuthenticationTapped() {
        switch authType {
        case .login:
            authState.login(with: .emailAndPassword(email: mail, password: password))
        case .signup:
            authState.signup(email: mail, password: password, passwordConfirmation: passwordConf)
        }
    }
}

struct AuthentificationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthentificationView()
    }
}
