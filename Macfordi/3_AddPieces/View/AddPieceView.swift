//
//  AddPieceView.swift
//  Macfordi
//
//  Created by Louis Jeanty on 22/12/2021.
//

import SwiftUI

struct AddPieceView: View {
    
    @State var datasRef = [
        SearchData(name: "1234"),
        SearchData(name: "4564"),
        SearchData(name: "9574")
    ]
    
    @State var dataNom = [
        SearchData(name: "Louis"),
        SearchData(name: "JEANTY"),
        SearchData(name: "Test")
    ]
    
    @State var reference: String = ""
    @State var nom: String = ""
    @State var quantite: String = ""
    
    var body: some View {
        VStack {
            HStack {
                NavigationLink(destination: {
                    SearchView(title: "Rechercher par référence", textSearch: $reference, data: $datasRef)
                }, label: {
                    ButtonEnriched(placeholder: "Reference", text: $reference)
                })
                Spacer()
                NavigationLink(destination: {
                    SearchView(title: "Rechercher par Nom", textSearch: $nom, data: $dataNom)
                }, label: {
                    ButtonEnriched(placeholder: "Nom", text: $nom)
                })
                TextField("Quantité", text: $quantite)
                    .underlineTextField()
                Button(action: {
                    //add piece in array
                }, label: {
                    ButtonPrimaryWithImage(text: "Ajouter la / les pièces", imageName: "plus")
                })
            }
            VStack(alignment: .leading) {
                Text("Pièces")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(Colors.Enable)
                    //TODO: Add all pieces selected
//                ScrollView {
//                    ForEach(viewModel.pieces, id: \.id) {
//                        piece in
//                        onePieceView(piece: piece, reference: $reference, nom: $nom, viewModel: viewModel)
//                    }
//                }
            }
            Spacer()
        }
        .padding(.horizontal)
        .navigationTitle("Ajouter des pièces")
    }
}

struct AddPieceView_Previews: PreviewProvider {
    static var previews: some View {
        AddPieceView()
    }
}
