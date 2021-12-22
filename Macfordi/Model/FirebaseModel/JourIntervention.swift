//
//  JourIntervention.swift
//  Macfordi
//
//  Created by Louis Jeanty on 22/12/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct JourIntervention: Identifiable, Codable, Equatable, Hashable {
    
    @DocumentID var id: String? = UUID().uuidString
    var date: Date
    var heureDebutAM: Date
    var heureDebutPM: Date
    var heureFinAM: Date
    var heureFinPM: Date
    var technicienID: String
    var repas: Bool
    var nuit: Bool
    var trajets: [Trajet]?
    
    enum CodingKeys: String, CodingKey {
        case id = ""
        case date = "Date"
        case heureDebutAM = "HeureDebutAM"
        case heureDebutPM = "HeureDebutPM"
        case heureFinAM = "HeureFinAM"
        case heureFinPM = "HeurerFinPM"
        case technicienID = "TechnicienID"
        case repas = "Repas"
        case nuit = "Nuit"
        case trajets = "Trajets"
    }
}
