//
//  PieceDataRepository.swift
//  Macfordi
//
//  Created by Louis Jeanty on 23/12/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class PieceDataRepository: ObservableObject {
    
    init() {    }
    
    private let pathPiece: String = "Piece"
    private let db = Firestore.firestore()
    
    @Published var pieces: [Piece] = []
    
    func get() {
        db.collection(pathPiece).addSnapshotListener {
            querySnapshot, error in
            
            if let err = error {
                print(err)
                return
            }
            
            self.pieces = querySnapshot?.documents.compactMap { document in
                try? document.data(as: Piece.self)
            } ?? []
        }
    }
    
    func add(_ piece: Piece) {
        do {
            _ = try db.collection(pathPiece).addDocument(from: piece)
        } catch {
            print("adding error : \(error)")
        }
    }
    
    func update(_ piece: Piece) {
        guard let pieceID = piece.id else {return}
        do {
            _ = try db.collection(pathPiece).document(pieceID).setData(from: piece)
        } catch {
            print("adding error : \(error)")
        }
    }
}
