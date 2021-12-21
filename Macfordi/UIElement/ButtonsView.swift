//
//  ButtonsView.swift
//  Macfordi
//
//  Created by Louis Jeanty on 21/12/2021.
//

import SwiftUI
struct ButtonPrimary: View {
    let text: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 55)
                .foregroundColor(Colors.Enable)
            Text(text)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
        }
    }
}

struct ButtonSecondary: View {
    let text: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Colors.Enable)
                .frame(height: 55)
            Text(text)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
        }
    }
}

struct ButtonThird: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.system(size: 18, weight: .semibold))
            .foregroundColor(Colors.Enable)
    }
}

struct BackButton: View {
    let text: String
    var body: some View {
        HStack {
            Image(systemName: "chevron.backward")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(Colors.Enable)
            Text(text ?? "")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(Colors.Enable)
        }
    }
}
