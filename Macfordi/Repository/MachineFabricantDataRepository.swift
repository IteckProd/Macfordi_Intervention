//
//  MachineFabricantDataRepository.swift
//  Macfordi
//
//  Created by Louis Jeanty on 23/12/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class MachineFabricantDataRepository: ObservableObject {
    
    init() {    }
    
    private let pathFabricant: String = "Fabricant"
    private let pathMachine: String = "Machine"
    
    private let db = Firestore.firestore()
    
    @Published var machines: [Fabricant: [Machine]] = [:]
    
    func getFabricants() {
        db.collection(pathFabricant).addSnapshotListener {
            querySnapshot, error in
            
            if let err = error {
                print(err)
                return
            }
            
            let fabricants = querySnapshot?.documents.compactMap { document in
                try? document.data(as: Fabricant.self)
            } ?? []
            
            for oneFabricant in fabricants {
                self.getMachines(fabricant: oneFabricant)
            }
        }
    }
    
    func addFabricant(_ fabricant: Fabricant) {
        //filter if fabricant exist
        do {
            _ = try db.collection(pathFabricant).addDocument(from: fabricant)
        } catch {
            print("adding error : \(error)")
        }
    }
    
    func updateFabricant(_ fabricant: Fabricant) {
        guard let fabricantId = fabricant.id else {return}
        do {
            try db.collection(pathFabricant).document(fabricantId).setData(from: fabricant)
        } catch {
            print("Error update data fabricant")
        }
    }
    
    func getMachines(fabricant: Fabricant) {
        guard let fabricantID = fabricant.id else {return}
        for oneMachine in fabricant.nameMachines {
            db.collection(pathFabricant).document(fabricantID).collection(oneMachine).addSnapshotListener {
                querySnapshot, error in
                
                if let err = error {
                    print(err)
                    return
                }
                
                let machines = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: Machine.self)
                } ?? []
                self.machines[fabricant] = machines
            }
        }
    }
    
    func addMachine(fabricant: Fabricant, machine: Machine, nameModel: String) {
        guard let fabricantID = fabricant.id else {return}
        do {
            _ = try db.collection(pathFabricant).document(fabricantID).collection(nameModel).addDocument(from: machine)
        } catch {
            print("adding error : \(error)")
        }
    }
    
    func updateMachine(fabricant: Fabricant, machine: Machine, nameModel: String) {
        guard let fabricantId = fabricant.id else {return}
        guard let machineId = machine.id else {return}
        do {
            try db.collection(pathFabricant).document(fabricantId).collection(nameModel).document(machineId).setData(from: fabricant)
        } catch {
            print("Error update data fabricant")
        }
    }
    
}
