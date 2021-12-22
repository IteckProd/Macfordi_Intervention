//
//  Intervention.swift
//  Macfordi
//
//  Created by Louis Jeanty on 22/12/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct InterventionModel: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var idClient: String
    var pieces: [String: Double] //[id:Quantite]
    var idMachine: DocumentReference
    var nomSignature: String
    var remarqueClient: String
    var remarqueMacfordi: String
    var imageURL: [String]
    var signatureURL: String
    var travaux: String
    var atelier: Bool
    var mail: String
    var nameInterlocuteur: String
    
    enum CodingKeys: String, CodingKey {
        case id = ""
        case idClient = "IDClient"
        case pieces = "Pieces"
        case idMachine = "IDMachine"
        case nomSignature = "NomSignature"
        case remarqueClient = "RemarqueClient"
        case remarqueMacfordi = "RemarqueMacfordi"
        case imageURL = "ImageURL"
        case signatureURL = "SignatureURL"
        case travaux = "Travaux"
        case atelier = "Atelier"
        case mail = "MailClient"
        case nameInterlocuteur = "NameInterlocuteur"
    }
}
