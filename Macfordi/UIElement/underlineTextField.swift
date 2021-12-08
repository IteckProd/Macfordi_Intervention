//
//  underlineTextField.swift
//  Only Green
//
//  Created by Louis Jeanty on 30/09/2021.
//  Copyright © 2021 Only Vert. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    static let darkPink = Color(red: 208 / 255, green: 45 / 255, blue: 208 / 255)
}
extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(Colors.Enable)
            .padding(10)
    }
}
