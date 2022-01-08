//
//  PrimaryInformationViewModel.swift
//  Macfordi
//
//  Created by Louis Jeanty on 23/12/2021.
//

import Foundation
import Combine

class PrimaryInformationViewModel: ObservableObject, Identifiable {
    
    private let interventionRepository = InterventionDataRepository()
    private let clientRepository = ClientDataRepository()
    private let machineFabricantRepository = MachineFabricantDataRepository()
    
    @Published var intervention: Intervention
    @Published var clients: [Client] = []
    @Published var machines: [Fabricant: [Machine]] = [:]
    
    @Published var machineSearch: [SearchData] = []
    
    private var cancellables: Set<AnyCancellable> = []
    var id = ""
    
    init(intervention: Intervention) {
        self.intervention = intervention
        $intervention
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
        
        clientRepository.$clients
            .assign(to: \.clients, on: self)
            .store(in: &cancellables)
        
//        machineFabricantRepository.$machines
//            .map {
//                machines in
//                machines.map(machineSearch(name: ""))
//            }
//            .assign(to: \.machines, on: self)
//            .store(in: &cancellables)
    }
    
    func generateReference() {
        id = "MACxxxx"
    }
}
