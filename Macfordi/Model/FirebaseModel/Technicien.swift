//
//  Technicien.swift
//  Macfordi
//
//  Created by Louis Jeanty on 22/12/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Technicien: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id = ""
        case name = "FullName"
    }
}
