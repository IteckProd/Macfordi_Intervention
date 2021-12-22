//
//  DetailInformationView.swift
//  Macfordi
//
//  Created by Louis Jeanty on 22/12/2021.
//

import SwiftUI

struct DetailInformationView: View {
    @State private var serialNumber: String = ""
    @State private var machineNumber: String = ""
    @State private var hammerNumber: String = ""
    @State private var parcNumber: String = ""
    //@State private var images = [ImageIntervention]()
    @State var uuid = UUID().uuidString
    @State private var macfordiDescription = "Description Macfordi"
    @State private var macfordiInformation = "Informations"
    
    //Maybe in vm
    @State var countDays = ""
    @State var countTrajets = ""
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                MachineInformations(serialNumber: $serialNumber, machineNumber: $machineNumber, hammerNumber: $hammerNumber, parcNumber: $parcNumber)
                Group {
                    InterventionDayView()
                    Spacer()
                    resumeDays()
                    TextEditor(text: $macfordiDescription)
                        .border(Colors.Background)
                        .cornerRadius(10)
                        .frame(minHeight: 120, alignment: .leading)
                        .padding(.top, 50)
                    //TODO: Image intervention View
                    Spacer()
                    TextEditor(text: $macfordiInformation)
                        .border(Colors.Background)
                        .cornerRadius(10)
                        .frame(minHeight: 120, alignment: .leading)
                        .padding(.top, 50).padding(.bottom, 50)
                }.padding(.horizontal)
                
            }
        }
        .navigationBarTitle("Informations Intervention")
    }
}

struct MachineInformations:View {
    @Binding var serialNumber: String
    @Binding var machineNumber: String
    @Binding var hammerNumber: String
    @Binding var parcNumber: String
    
    var body: some View {
        TextField("Numéro de série", text: $serialNumber)
            .underlineTextField()
        HStack {
            TextField("Heures machine", text: $machineNumber)
                .underlineTextField().padding(.bottom, 30)
            TextField("Heures marteau (facultatif)", text: $hammerNumber)
                .underlineTextField().padding(.bottom, 30)
            TextField("Numéro de parc (facultatif)", text: $parcNumber)
                .underlineTextField().padding(.bottom, 30)
        }
    }
}

struct InterventionDayView: View {
    @State private var isPresented = false
    @State private var isPresentedSolo = false
    
    var body: some View {
        HStack {
            Title1(name: "Jour d'ntervention")
            Spacer()
            Button(action: {
                //ajout d'une journée
            }, label: {
                ButtonPrimaryWithImage(text: "Ajouter une journée", imageName: "plus")
            }).frame(width: 256, height: 54)
        }.padding(.bottom)
        
        HStack {
            Text("Date")
                .foregroundColor(.gray)
            Spacer()
            Text("Trajet")
                .foregroundColor(.gray)
                .padding(.trailing, -40)
            Spacer()
            Text("Durée")
                .foregroundColor(.gray)
                .padding(.trailing, 40)
        }
        Divider()
        //TODO: Afficher erreur si y'a pas d'intervention
        //forEach
        Button(action: {
            //present selcted day
        }, label: {
            HStack {
//                Text(day.date.toString(dateFormat: DateFormat.dayMouthYear))
//                    .foregroundColor(.black)
                Spacer()
//                if day.trajets == nil {
//                    Text("0")
//                        .foregroundColor(.black)
//                } else {
//                    Text("\(day.trajets!.count)")
//                        .foregroundColor(.black)
//                }
                Spacer()
                Text("06h21")
                    .foregroundColor(.black)
                Image(systemName: "chevron.right")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(Colors.Enable)
            }
        })
            .padding(.all)
            .background(Color(.white))
            .cornerRadius(10)
    }
}

struct resumeDays: View {
    //@ObservedObject var viewModel: InterventionViewModelNew
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                VStack(alignment: .leading) {
//                    Text("\(viewModel.daysIntervention.count)")
//                        .foregroundColor(ColorPalette.enableColor)
//                        .font(.system(size: 36, weight: .bold))
                    HStack {
//                        Text(viewModel.isMultiple(viewModel.daysIntervention.count) ? "journées" : "journée")
//                            .foregroundColor(ColorPalette.secondtextColor)
//                            .font(.system(size: 23, weight: .semibold))
                    }
                }
            }.frame(width: 156, height: 156)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                VStack(alignment: .leading) {
//                    Text("\(viewModel.allTrajets.count)")
//                        .foregroundColor(ColorPalette.enableColor)
//                        .font(.system(size: 36, weight: .bold))
                    HStack {
//                        Text(viewModel.isMultiple(viewModel.allTrajets.count) ? "Trajets" : "Trajet")
//                            .foregroundColor(ColorPalette.secondtextColor)
//                            .font(.system(size: 23, weight: .semibold))
                    }
                }
            }.frame(width: 156, height: 156)
            Spacer()
        }
    }
}

struct DetailInformationView_Previews: PreviewProvider {
    static var previews: some View {
        DetailInformationView()
    }
}
