//
//  PrimaryInformationsView.swift
//  Macfordi
//
//  Created by Louis Jeanty on 21/12/2021.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseFirestore

struct PrimaryInformationsView: View {
    
    @ObservedObject private var keyboard = KeyboardResponder()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = PrimaryInformationViewModel(intervention: Intervention(id: "MAC0000", idClient: "", pieces: [:], idMachine: Firestore.firestore().collection("Intervention").document("MAC0000"), nomSignature: "", remarqueClient: "", remarqueMacfordi: "", imageURL: [], signatureURL: "", travaux: "", atelier: true, mail: "", nameInterlocuteur: ""))
    
    //Infos client
    @State var nameClient: String = ""
    @State var nameInterlocuteur: String = ""
    @State var nameFabricant: String = ""
    @State var NameMachine: String = ""
    
    //adresse client
    @State var number: String = ""
    @State var adresse: String = ""
    @State var codePostal: String = ""
    @State var ville: String = ""
    
    //TEMP:
    @State var datas = [SearchData]()
    
    var body: some View {
        VStack {
            HStack {
                Text("Référence : ")
                    .font(.system(size: 18))
                //TODO: Générate Reference
                Text("à définir")
                    .font(.system(size: 18, weight: .bold))
                Spacer()
//                Button(action: {
//                    viewModel.uploadExistingMachine()
//                }, label: {
//                    ButtonPrimary(text: "add machines")
//                })
            }
            
            Group {
                //Infos client
                HStack {
                    NavigationLink(destination: {
                        SearchView(title: "Nom du client", textSearch: $nameClient, data: $datas)
                    }, label: {
                        ButtonEnriched(placeholder: "Nom du client", text: $nameClient)
                    }).padding(.trailing)
                    Spacer()
                    NavigationLink(destination: {
                        SearchView(title: "Nom de l'interlocuteur", textSearch: $nameInterlocuteur, data: $datas)
                    }, label: {
                        ButtonEnriched(placeholder: "Nom de l'interlocuteur", text: $nameInterlocuteur)
                    })
                }
            }.padding(.bottom)
            
            Group {
                //Infos machine
                HStack {
                    NavigationLink(destination: {
                        SearchView(title: "Nom du Fabriquant", textSearch: $nameFabricant, data: $viewModel.fabricantSearch)
                            .onAppear() {
                                viewModel.createSearchFabricantData()
                            }
                    }, label: {
                        ButtonEnriched(placeholder: "Nom du fabriquant", text: $nameFabricant)
                    }).padding(.trailing)
                    Spacer()
                    NavigationLink(destination: {
                        SearchView(title: "Nom de la machine", textSearch: $NameMachine, data: $viewModel.machineSearch)
                            .onAppear() {
                                viewModel.createSearchMachineData(fabricantName: nameFabricant)
                            }
                    }, label: {
                        ButtonEnriched(placeholder: "Nom de la machine", text: $NameMachine)
                    })
                }
            }.padding(.bottom, 50)
            
            GeometryReader {
                geo in
                VStack {
                    HStack {
                        TextField("Numéro", text: $number) {
                            UIApplication.shared.endEditing()
                        }
                        .underlineTextField()
                        .frame(width: geo.size.width * 1/4)
                        TextField("Adresse", text: $adresse)
                            .underlineTextField()
                    }
                    HStack {
                        TextField("Code Postal",text: $codePostal)
                            .underlineTextField()
                            .frame(width: geo.size.width * 1/4)
                        TextField("Ville", text: $ville)
                            .underlineTextField()
                    }
                }
            }
            .padding(.bottom, keyboard.currentHeight)
            .edgesIgnoringSafeArea(.bottom)
            //TODO: Maps intervention exterieur
            
        }.padding(.horizontal).padding(.top)
            .navigationBarTitle("Informations Client")
    }
}

struct PrimaryInformationsView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryInformationsView(nameClient: "")
    }
}
