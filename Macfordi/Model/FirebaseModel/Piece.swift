//
//  Piece.swift
//  Macfordi
//
//  Created by Louis Jeanty on 22/12/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct PieceModel: Identifiable, Codable, Equatable, Hashable {
    @DocumentID var id: String? = UUID().uuidString
    var reference: String
    var nom: String
    
    enum CodingKeys: String, CodingKey {
        case id = ""
        case reference = "Reference"
        case nom = "Nom"
    }
}
