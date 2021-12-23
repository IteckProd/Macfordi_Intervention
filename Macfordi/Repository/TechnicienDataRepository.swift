//
//  TechnicienDataRepository.swift
//  Macfordi
//
//  Created by Louis Jeanty on 23/12/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class TechnicienDataRepository: ObservableObject {
    
    init() {
        get()
    }
    
    private let pathTechnicien: String = "Technicien"
    private let db = Firestore.firestore()
    
    @Published var techniciens: [Technicien] = []
    
    func get() {
        db.collection(pathTechnicien).addSnapshotListener {
            querySnapshot, error in
            
            if let err = error {
                print(err)
                return
            }
            
            self.techniciens = querySnapshot?.documents.compactMap { document in
                try? document.data(as: Technicien.self)
            } ?? []
        }
    }
    
    func add(_ technicien: Technicien) {
        do {
            _ = try db.collection(pathTechnicien).addDocument(from: technicien)
        } catch {
            print("adding error : \(error)")
        }
    }
    
    func update(_ technicien: Technicien) {
        guard let technicienID = technicien.id else {return}
        do {
            _ = try db.collection(pathTechnicien).document(technicienID).setData(from: technicien)
        } catch {
            print("adding error : \(error)")
        }
    }
    
    
}
