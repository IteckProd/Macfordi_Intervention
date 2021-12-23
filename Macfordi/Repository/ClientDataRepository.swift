//
//  ClientDataRepository.swift
//  Macfordi
//
//  Created by Louis Jeanty on 23/12/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class ClientDataRepository: ObservableObject {
    
    init() {
        get()
    }
    
    private let pathClient: String = "Client"
    private let db = Firestore.firestore()
    
    @Published var clients: [Client] = []
    
    func get() {
        db.collection(pathClient).addSnapshotListener {
            querySnapshot, error in
            
            if let err = error {
                print(err)
                return
            }
            
            self.clients = querySnapshot?.documents.compactMap { document in
                try? document.data(as: Client.self)
            } ?? []
        }
    }
    
    func add(_ client: Client) {
        do {
            _ = try db.collection(pathClient).addDocument(from: client)
        } catch {
            print("adding error : \(error)")
        }
    }
    
    func update(_ client: Client) {
        guard let clientID = client.id else {return}
        do {
            _ = try db.collection(pathClient).document(clientID).setData(from: client)
        } catch {
            print("adding error : \(error)")
        }
    }
    
}
