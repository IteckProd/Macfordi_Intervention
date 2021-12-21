//
//  SearchView.swift
//  Macfordi
//
//  Created by Louis Jeanty on 21/12/2021.
//

import SwiftUI

struct SearchData: Identifiable {
    let id = UUID()
    let name: String
}

struct SearchView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let title: String
    @Binding var textSearch: String
    @Binding var data: [SearchData]
    
    var body: some View {
        VStack {
            SearchBar(text: $textSearch)
                List(data.filter({ textSearch.isEmpty ? true : $0.name.contains(textSearch)})) {
                    oneElement in
                    Button {
                        withAnimation {
                            textSearch = oneElement.name
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    } label: {
                        Text(oneElement.name)
                    }
                }
            }
        .navigationBarTitle(title)
        .padding(.all)
        .onAppear {
            // Set the default to clear
            UITableView.appearance().backgroundColor = .clear
        }
    }
}
