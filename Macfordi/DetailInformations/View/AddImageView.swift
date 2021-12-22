//
//  AddImageView.swift
//  Macfordi
//
//  Created by Louis Jeanty on 22/12/2021.
//

import Foundation
import SwiftUI
struct AddImage: View {
    
    @State private var image: UIImage? = UIImage(named: "Img")
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    @Binding var images: [ImageModel]
    
    var withID: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 100, alignment: .center)
                .aspectRatio(4/3, contentMode: .fill)
                .foregroundColor(.white)
                .cornerRadius(20)
            Image(systemName: "plus")
                .font(.system(size: 48, weight: .semibold))
                .foregroundColor(Colors.Enable)
        }.onTapGesture { self.shouldPresentActionScheet = true }
        .sheet(isPresented: $shouldPresentImagePicker) {
            ImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image, isPresented: self.$shouldPresentImagePicker).onDisappear(perform: {
                if image != UIImage(named: "Img") {
                    //observe image
                    images.append(ImageModel(id: "image\(images.count)", image: image!))
                }
            })
        }.actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
            ActionSheet(title: Text("Ajouter une photo"), message: Text(""), buttons: [ActionSheet.Button.default(Text("Prendre une photo"), action: {
                self.shouldPresentImagePicker = true
                self.shouldPresentCamera = true
                
            }), ActionSheet.Button.default(Text("Depuis la bibliothèque"), action: {
                self.shouldPresentImagePicker = true
                self.shouldPresentCamera = false
            }), ActionSheet.Button.cancel()])
        }
    }
}
