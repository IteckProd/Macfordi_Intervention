//
//  Machine.swift
//  Macfordi
//
//  Created by Louis Jeanty on 22/12/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Machine: Identifiable, Codable, Equatable, Hashable {
    
    @DocumentID var id: String? = UUID().uuidString
    
    var hMachine: String
    var hMarteau: String?
    var numParc: String?
    var numSerie: String
    
    enum CodingKeys: String, CodingKey {
        case id = ""
        case hMachine = "HeureMachine"
        case hMarteau = "HeureMarteau"
        case numParc = "NumeroParc"
        case numSerie = "NumeroSerie"
    }
}
