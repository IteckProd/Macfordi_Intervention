//
//  Fabricant.swift
//  Macfordi
//
//  Created by Louis Jeanty on 22/12/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Fabricant: Identifiable, Codable, Equatable, Hashable {
    
    @DocumentID var id: String? = UUID().uuidString
    
    var nameMachines: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = ""
        case nameMachines = "NameMachines"
    }
}
