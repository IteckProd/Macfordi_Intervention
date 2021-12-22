//
//  ImageModel.swift
//  Macfordi
//
//  Created by Louis Jeanty on 22/12/2021.
//

import Foundation
import SwiftUI
import UIKit

class ImageModel {
    
    init(id: String, image: UIImage) {
        self.id = id
        self.image = image
    }
    
    var id: String
    var image: UIImage
}
