//
//  Trajet.swift
//  Macfordi
//
//  Created by Louis Jeanty on 22/12/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Trajet: Identifiable, Codable, Equatable, Hashable {
    @DocumentID var id: String? = UUID().uuidString
    var distance: Double
    var heureDebut: Date
    var heureFin: Date
    
    enum CodingKeys: String, CodingKey {
        case id = ""
        case distance = "Distance"
        case heureDebut = "HeureDebut"
        case heureFin = "HeureFin"
    }
}
