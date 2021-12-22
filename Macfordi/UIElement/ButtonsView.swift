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

struct ButtonPrimaryWithImage: View {
    let text: String
    let imageName: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 55)
                .foregroundColor(Colors.Background)
            HStack {
                Text(text)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(text.isEmpty ? .gray : Colors.Enable)
                Spacer()
                Image(systemName: imageName)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Colors.Enable)
            }.padding(.all)
            
        }.frame(width: 256, height: 54)
    }
}

struct ButtonPrimaryWithImageMini: View {
    let text: String
    let imageName: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 54)
                .foregroundColor(Colors.Background)
            HStack {
                Text(text)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(text.isEmpty ? .gray : Colors.Enable)
                Spacer()
                Image(systemName: imageName)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Colors.Enable)
            }.padding(.all)
            
        }.frame(width: 180, height: 54)
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

struct ButtonEnriched: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 55)
                .foregroundColor(Colors.Background)
            HStack {
                Text(text.isEmpty ? placeholder : text)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(text.isEmpty ? .gray : Colors.Enable)
                Spacer()
                Image(systemName: "chevron.forward")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Colors.Enable)
            }.padding(.all)
            
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
