//
//  InterventionRepository.swift
//  Macfordi
//
//  Created by Louis Jeanty on 23/12/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class InterventionDataRepository: ObservableObject {
    //Jour intervention / Trajets
    init() {
        
    }
    
    private let pathIntervention: String = "intervention"
    private let pathJourIntervention: String = "jourIntervention"
    private let pathTrajet: String = "Trajet"
    private let db = Firestore.firestore()
    
    @Published var interventionArray: [Intervention] = []
    @Published var intervention: Intervention?
    @Published var joursIntervention: [JourIntervention] = []
    @Published var trajets: [Trajet] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    func getIntervention(_ id: String) {
        db.collection(pathIntervention).document(id).addSnapshotListener {
            querySnapshot, error in
            
            if let err = error {
                print("Error  getting intervention data : \(err.localizedDescription)")
                return
            }
            
            if let snap = querySnapshot {
                do {
                    self.intervention = try snap.data(as: Intervention.self)!
                } catch {
                    print("Error : \(error.localizedDescription)")
                }
            } else {
                print("cannot get snapshot")
            }
            
        }
    }
    
    func getInterventions() {
        db.collection(pathIntervention).addSnapshotListener {
            querySnapshot, error in
            
            if let err = error {
                print(err)
                return
            }
            
            self.interventionArray = querySnapshot?.documents.compactMap { document in
                try? document.data(as: Intervention.self)
            } ?? []
        }
    }
    
    func getJoursIntervention(intervention: Intervention) {
        guard let interventionID = intervention.id else {return}
        db.collection(pathIntervention).document(interventionID).collection(pathJourIntervention).addSnapshotListener {
            querySnapshot, error in
            
            if let err = error {
                print(err)
                return
            }
            
            self.joursIntervention = querySnapshot?.documents.compactMap { document in
                try? document.data(as: JourIntervention.self)
            } ?? []
        }
    }
    
    func getTrajet(intervention: Intervention, jourIntervention: JourIntervention) {
        guard let jourID = jourIntervention.id else {return}
        guard let interventionID = intervention.id else {return}
        
        db.collection(pathIntervention)
            .document(interventionID)
            .collection(pathJourIntervention)
            .document(jourID)
            .collection(pathTrajet).addSnapshotListener {
                querySnapshot, error in
                
                if let err = error {
                    print(err)
                    return
                }
                self.trajets = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: Trajet.self)
                } ?? []
            }
    }
    
    func addIntervention(_ intervention: Intervention) {
        do {
            _ = try db.collection(pathIntervention).addDocument(from: intervention)
        } catch {
            print("adding error : \(error)")
        }
    }
    
    func addJourIntervention(intervention: Intervention, jourIntervention: JourIntervention) {
        guard let interventionID = intervention.id else {return}
        do {
            _ = try db.collection(pathIntervention).document(interventionID).collection(pathJourIntervention).addDocument(from: jourIntervention)
        } catch {
            print("adding error : \(error)")
        }
    }
    
    func addTrajet(intervention: Intervention, jourIntervention: JourIntervention, trajet: Trajet) {
        guard let jourID = jourIntervention.id else {return}
        guard let interventionID = intervention.id else {return}
        do {
            _ = try db.collection(pathIntervention).document(interventionID).collection(pathJourIntervention).document(jourID).collection(pathTrajet).addDocument(from: trajet)
        } catch {
            print("adding error : \(error)")
        }
    }
    
    func updateIntervention(_ intervention: Intervention) {
        guard let interventionID = intervention.id else {return}
        do {
            _ = try db.collection(pathIntervention).document(interventionID).setData(from: intervention)
        } catch {
            print("adding error : \(error)")
        }
    }
    
    func updateJourIntervention(intervention: Intervention, jourIntervention: JourIntervention) {
        guard let interventionID = intervention.id else {return}
        guard let jourInterventionID = jourIntervention.id else {return}
        do {
            _ = try db.collection(pathIntervention).document(interventionID).collection(pathJourIntervention).document(jourInterventionID).setData(from: jourIntervention)
        } catch {
            print("adding error : \(error)")
        }
    }
    
    func updateTrajet(intervention: Intervention, jourIntervention: JourIntervention, trajet: Trajet) {
        guard let jourID = jourIntervention.id else {return}
        guard let interventionID = intervention.id else {return}
        guard let trajetID = trajet.id else {return}
        do {
            _ = try db.collection(pathIntervention)
                .document(interventionID)
                .collection(pathJourIntervention)
                .document(jourID)
                .collection(pathTrajet)
                .document(trajetID).setData(from: trajet)
        } catch {
            print("adding error : \(error)")
        }
    }
    
}
