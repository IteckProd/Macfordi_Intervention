//
//  SegmentedView.swift
//  Macfordi
//
//  Created by Louis Jeanty on 22/12/2021.
//

import SwiftUI

struct SegmentedView: View {
    @State private var selectedView = 0
    var body: some View {
        VStack {
            Picker("", selection: $selectedView) {
                Text("Client").tag(0)
                Text("Intervention").tag(1)
                Text("Pièces").tag(2)
                Text("Resumé").tag(3)
            }.pickerStyle(.segmented).padding(.horizontal)
            
            if selectedView == 0 {
                PrimaryInformationsView()
            } else if selectedView == 1 {
                DetailInformationView()
            }
        }
    }
}

struct SegmentedView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedView()
    }
}
