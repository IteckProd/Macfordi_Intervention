//
//  Client.swift
//  Macfordi
//
//  Created by Louis Jeanty on 22/12/2021.
//
import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Client: Identifiable, Codable, Equatable, Hashable {
    
    @DocumentID var id: String? = UUID().uuidString
    
    var name: String
    var adresse: String
    
    enum CodingKeys: String, CodingKey {
        case id = ""
        case name = "Name"
        case adresse = "Adresse"
    }
}
