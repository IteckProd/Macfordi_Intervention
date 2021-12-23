//
//  clientClass.swift
//  Macfordi Intervention
//
//  Created by Louis Jeanty on 11/08/2020.
//  Copyright © 2020 Macfordi. All rights reserved.
//

import Foundation

class ClientCSV: NSObject {
    var nCompte: Int?
    var nomClient: String?
    
    init(nCompte: Int, nomClient: String){
        self.nCompte = nCompte
        self.nomClient = nomClient
        
        super.init()
    }
    
}

class Stock: NSObject {
    var reference: String?
    var designation: String?
    init(reference: String, designation: String){
        self.reference = reference
        self.designation = designation
        super.init()
    }
}

class MachineCSV: NSObject {
    var fabricant: String?
    var machine: String?
    init(fabricant: String, machine: String){
        self.fabricant = fabricant
        self.machine = machine
        super.init()
    }
}

struct csvData {
    static var allClient: [ClientCSV] = []
    static var allStock: [Stock] = []
    static var allMachine: [MachineCSV] = []
}
