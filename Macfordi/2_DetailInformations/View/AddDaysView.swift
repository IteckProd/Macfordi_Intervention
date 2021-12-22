//
//  AddDaysView.swift
//  Macfordi
//
//  Created by Louis Jeanty on 22/12/2021.
//

import SwiftUI

struct AddDaysView: View {
    
    @Binding var isPresented: Bool
    //Technicien
    @State private var haveRepas = false
    @State private var haveNuit = false
    
    //JourInter
    @State var date = Date()
    @State var heureDebutAM = Date()
    @State var heureDebutPM = Date()
    @State var heureFinAM = Date()
    @State var heureFinPM = Date()
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    isPresented = false
                }, label: {
                    BackButton(text: "Quitter sans sauvegarder")
                })
                Spacer()
                Button(action: {
                    //TODO: Save data
                    isPresented = false
                }, label: {
                    //TODO: test si modif ou ajout
                    ButtonPrimaryWithImage(text: "Ajouter la journée", imageName: "plus")
                })
            }
            ScrollView(.vertical, showsIndicators: false) {
                addDayView(date: $date, heureDebutAM: $heureDebutAM, heureDebutPM: $heureDebutPM, heureFinAM: $heureFinAM, heureFinPM: $heureFinPM)
                Spacer()
                VStack {
                    AddTechnicien()
                    HStack {
                        Toggle("Repas", isOn: $haveRepas)
                        Divider().padding(.horizontal, 100)
                        Toggle("Nuit", isOn: $haveNuit)
                    }.toggleStyle(SwitchToggleStyle(tint: Colors.Enable))
                }
                addListTrajet()
            }
        }
    }
}

struct addDayView: View {
    //@ObservedObject var viewModel: DayInterventionViewModel
    @Binding var date: Date
    @Binding var heureDebutAM: Date
    @Binding var heureDebutPM: Date
    @Binding var heureFinAM: Date
    @Binding var heureFinPM: Date
    
    var body: some View {
        VStack {
            HStack {
                Text("journée d'intervention")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(Colors.Enable)
                Spacer()
            }
            HStack {
                DatePicker(selection: $date, displayedComponents: .date) {
                    Text("Selectionnez la date")
                }
            }
            Spacer()
            //Heures
            HStack {
                VStack(alignment: .leading) {
                    Text("Matin")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(.black)
                    DatePicker(selection: $heureDebutAM, displayedComponents: .hourAndMinute, label: { Text("Heure de début")})
                    Spacer()
                    DatePicker(selection: $heureFinAM, displayedComponents: .hourAndMinute, label: { Text("Heure de fin")})
                }
                Divider()
                    .padding(.horizontal, 50)
                VStack(alignment: .leading) {
                    Text("Après-midi")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(.black)
                    DatePicker(selection: $heureDebutPM, displayedComponents: .hourAndMinute, label: { Text("Heure de début")})
                    Spacer()
                    DatePicker(selection: $heureFinPM, displayedComponents: .hourAndMinute, label: { Text("Heure de fin")})
                }
            }.padding(.bottom, 50)
        }
    }
}

struct AddTechnicien: View {
    
    @State var datas = [
        SearchData(name: "Louis"),
        SearchData(name: "Name2"),
        SearchData(name: "Name3")
    ]
    
    @State var selectedTechnicien = ""
    
    //@ObservedObject var viewModel: DayInterventionViewModel
    @State var isPresented: Bool = false
    var body: some View {
        VStack {
            HStack {
                Text("Techniciens")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(Colors.Enable)
                Spacer()
                Button(action: {
                    //ajouter un technicien
                    isPresented.toggle()
                }, label: {
                    //modifer
                    ButtonPrimaryWithImage(text: "Ajouter un technicien", imageName: "plus")
                })
            }
            //TODO: Check if on technicien
            if 0 == 0 {
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 256, height: 48)
                        .foregroundColor(.white)
                        .overlay(
                            HStack {
//                                Text("\(viewModel.selectedTechnicien!.firstName) \(viewModel.selectedTechnicien!.name)")
                                Spacer()
                                Button(action: {
                                    //delete technicien
//                                    viewModel.disSelectTechnicien(viewModel.selectedTechnicien!)
                                }, label: {
                                    Image(systemName: "plus")
                                        .rotationEffect(.degrees(45))
                                        .font(.system(size: 17, weight: .semibold))
                                        .foregroundColor(.gray)
                                })
                            }
                                .padding(.horizontal)
                                .font(.system(size: 17, weight: .semibold))
                        )
                    Spacer()
                }
            } else {
                Text("Aucun technicien")
                    .foregroundColor(Color.gray)
            }
        }
        .padding(.bottom, 25)
        .sheet(isPresented: $isPresented) {
            SearchView(title: "Ajouter un technicien", textSearch: $selectedTechnicien, data: $datas)
        }
    }
}

struct addListTrajet: View {
    //@ObservedObject var viewModel: DayInterventionViewModel
    @State private var DistanceText = ""
    @State private var heureDebut = Date()
    @State private var heureFin = Date()
    var body: some View {
        VStack {
            HStack {
                Text("Trajets")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(Colors.Enable)
                Spacer()
            }
            HStack {
                DatePicker(selection: $heureDebut, displayedComponents: .hourAndMinute) {
                    Text("Début")
                }
                Divider().padding(.horizontal)
                DatePicker(selection: $heureFin, displayedComponents: .hourAndMinute) {
                    Text("Fin")
                }
                TextField("Distance", text: $DistanceText)
                    .padding(.horizontal)
                //TODO: Check if trajet is selected or check in label directly
                if 0 == 0 {
                    Button(action: {
                        //ajouter un trajet
//                        viewModel.addTrajet(TrajetModel(distance: Double(DistanceText) ?? 0, heureDebut: heureDebut, heureFin: heureFin))
                    }, label: {
                        ButtonPrimaryWithImageMini(text: "Ajouter", imageName: "plus")
                    })
                } else {
                    Button(action: {
                        //modifier un trajet
//                        viewModel.selectedTrajet?.heureDebut = heureDebut
//                        viewModel.selectedTrajet?.heureFin = heureFin
//                        viewModel.selectedTrajet?.distance = Double(DistanceText) ?? 0
//                        viewModel.updateTrajet() {
//                            success in
//                            DistanceText = "0"
//                            heureDebut = Date()
//                            heureFin = Date()
//                        }
                    }, label: {
                        ButtonPrimaryWithImage(text: "Modifier", imageName: "pencil")
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 128, height: 48)
                                .foregroundColor(Colors.Enable)
                            HStack {
                                //switch button en modifier
                                Image(systemName: "pencil")
                                Text("Modifier")
                            }
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                        }
                    })
                }
                
            }.padding(.bottom)
            //TODO: Check if trajet exist
            if 0 == 0 {
                Text("Ajoutez votre premier trajet en cliquant sur \"ajouter\"")
                    .foregroundColor(.gray)
            } else {
                HStack {
                    Text("Heure début")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("Heure Fin")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("Durée")
                        .foregroundColor(.gray)
                        .padding(.trailing, 60)
                }
                Divider()
                //TODO: Create for each
//                ForEach(viewModel.trajets, id: \.self) { trajet in
//                    HStack {
//                        Text(trajet.heureDebut.toString(dateFormat: DateFormat.hoursMinutes))
//                            .foregroundColor(.black)
//                        Spacer()
//                        Text(trajet.heureFin.toString(dateFormat: DateFormat.hoursMinutes))
//                            .foregroundColor(.black)
//                        Spacer()
//                        Text(viewModel.calculeTimeTrajet(trajet))
//                            .foregroundColor(.black)
//                        Button(action: {
//                            //modifier
//                            heureDebut = trajet.heureDebut
//                            heureFin = trajet.heureFin
//                            DistanceText = String(trajet.distance)
//                            viewModel.selectedTrajet = trajet
//                        }, label: {
//                            Image(systemName: "pencil")
//                                .font(.system(size: 22, weight: .bold))
//                                .foregroundColor(ColorPalette.enableColor)
//                        })
//                        Button(action: {
//                            //supprimer
//                            viewModel.removeTrajet(trajet)
//                        }, label: {
//                            Image(systemName: "plus")
//                                .rotationEffect(.degrees(45))
//                                .font(.system(size: 17, weight: .semibold))
//                                .foregroundColor(ColorPalette.secondtextColor)
//                        })
//
//                    }
//                    .padding(.all)
//                    .background(Color(.white))
//                    .cornerRadius(10)
//                }
            }
        }
    }
}

