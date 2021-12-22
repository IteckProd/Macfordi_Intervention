//
//  ResumeView.swift
//  Macfordi
//
//  Created by Louis Jeanty on 22/12/2021.
//

import SwiftUI

struct ResumeView: View {
    @State var commentaireClient = "Commentaire par le client"
    @State var nameSignataire = ""
    @State var email = ""
    @State var imageSignature: UIImage? = nil
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack {
                    Title1(name: "Informations Client")
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        ButtonPrimary(text: "Générer le PDF")
                            .frame(width: 256)
                    })
                }
                TextEditor(text: $commentaireClient)
                    .border(Colors.Background)
                    .cornerRadius(10)
                    .frame(minHeight: 120, alignment: .leading)
                    .padding(.top, 50).padding(.bottom, 50)
                TextField("Nom signataire", text: $nameSignataire)
                    .underlineTextField()
                    .padding(.bottom)
                TextField("Adresse Email", text: $email)
                    .underlineTextField()
                Spacer()
                SignatureView(onSave: {
                    image in
                    imageSignature = image
                }, onCancel: {
                    
                })
                
            }
        }
        .padding(.horizontal)
        .navigationTitle("Résume")
        .onAppear() {
            UIScrollView.appearance().bounces = false
        }
        .onDisappear() {
            UIScrollView.appearance().bounces = true
        }
    }
}

struct ResumeView_Previews: PreviewProvider {
    static var previews: some View {
        ResumeView()
    }
}
