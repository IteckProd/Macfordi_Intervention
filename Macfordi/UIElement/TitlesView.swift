//
//  TitlesView.swift
//  Macfordi
//
//  Created by Louis Jeanty on 21/12/2021.
//

import SwiftUI

struct Title1: View {
    let name: String
    var body: some View {
        Text(name)
            .font(.system(size: 36, weight: .semibold))
    }
}
