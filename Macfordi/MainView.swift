//
//  MainView.swift
//  Macfordi
//
//  Created by Louis Jeanty on 21/12/2021.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var authState: AuthenticationState
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    authState.signout()
                }, label: {
                    ButtonThird(text: "Se déconnecter")
                })
            }
            Spacer()
            
            NavigationLink(destination: {
                SegmentedView()
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Colors.Background)
                    VStack {
                        HStack {
                            Image(systemName: "house.circle.fill")
                                .font(.system(size: 64))
                                .foregroundColor(Colors.Enable)
                            Text("Intervention en atelier")
                                .font(.system(size: 32))
                            Spacer()
                        }.padding(.bottom)
                        Text("Lorem ipsum dolor sit amet")
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 18))
                        Spacer()
                    }.padding(.all)
                }.frame(height: UIScreen.main.bounds.height/4)
            })
            
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Colors.Background)
                VStack {
                    HStack {
                        Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                            .font(.system(size: 64))
                            .foregroundColor(Colors.Enable)
                        Text("Intervention sur chantier")
                            .font(.system(size: 32))
                        Spacer()
                    }.padding(.bottom)
                    Text("Lorem ipsum dolor sit amet")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 18))
                    Spacer()
                }.padding(.all)
            }.frame(height: UIScreen.main.bounds.height/4)
            Spacer()
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .padding(.all)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
