//
//  update csv.swift
//  Macfordi
//
//  Created by Louis Jeanty on 23/12/2021.
//

import Foundation
 
class UpdateCSV {
    var ipNAS = "217.128.94.75:21/Espace_application/"
    var userName = "ftp://Application"
    var password = "7faLayR4pR5NiJXLcFGs"
    
    func uploadExistingMachine() {
        loadData()
    }
    
    func loadData(){
        let baseURL = "\(userName):\(password)@\(ipNAS)"
        let url = URL(string: "\(baseURL)clients%20macfordi.csv")
        var data: Data? = nil
        if let anUrl = url {
            do {
                data = try Data(contentsOf: anUrl)
                if let allData = data {
                    let getData = csv(data: String(decoding: allData, as: UTF8.self))
                    for client in getData {
                        csvData.allClient.append(ClientCSV(nCompte: Int(client[0]) ?? 0, nomClient: client[1]))
                    }
                    loadStock()
                    loadMachine()
                } else {
                    //error
                }
            } catch {
                let url = URL(fileURLWithPath: Bundle.main.path(forResource: "clients", ofType: "csv")!)
                data = try? Data(contentsOf: url)
                if let allData = data {
                    let getData = csv(data: String(decoding: allData, as: UTF8.self))
                    for client in getData {
                        csvData.allClient.append(ClientCSV(nCompte: Int(client[0]) ?? 0, nomClient: client[1]))
                    }
                    loadStock()
                    loadMachine()
                } else {
                    //error
                }
                print(error)
            }
        }
        
    }
    
    func csv(data: String) -> [[String]] {
        var result: [[String]] = []
        let rows = data.components(separatedBy: "\n")
        for row in rows {
            let columns = row.components(separatedBy: ";")
            result.append(columns)
        }
        return result
    }
    
    func loadMachine() {
        var allFabricants = [String]()
        let baseURL = "\(userName):\(password)@\(ipNAS)"
        let url = URL(string: "\(baseURL)machine.csv")
        var data: Data? = nil
        if let anUrl = url {
            do {
                data = try Data(contentsOf: anUrl)
                //all fine with jsonData here
                if let allData = data {
                    let getData = csv(data: String(decoding: allData, as: UTF8.self))
                    for fabricant in 0..<getData[0].count {
                        //save fabricant
                        let thisFabricant = getData[0][fabricant]
                        if thisFabricant.isEmpty != true && thisFabricant != "" {
                            allFabricants.append(thisFabricant)
                        }
                        for machine in 1..<getData[fabricant].count {
                            let oneMachine = getData[machine][fabricant]
                            let oneFabricant = getData[0][fabricant]
                            if oneMachine.isEmpty == false &&  oneFabricant.isEmpty == false {
                                let leFabricant = getData[0][fabricant]
                                let laMachine = getData[machine][fabricant]
                                print(leFabricant, laMachine)
                                csvData.allMachine.append(MachineCSV(fabricant: leFabricant, machine: laMachine))
                                
                            } else {
                                //error
                            }
                        }
                    }
                    allFabricants.uniqued()
                    
                    for oneFabricant in allFabricants {
                        var allMachines = [String]()
                        allMachines.removeAll()
                        for machineData in csvData.allMachine {
                            if machineData.fabricant == oneFabricant {
                                guard let oneMachine = machineData.machine else {return}
                                if oneMachine != "\r" && oneMachine.isEmpty != true {
                                    allMachines.append(oneMachine)
                                }
                            }
                        }
                        print(oneFabricant," : ",allMachines, "/")
                        let uploadFabricant = Fabricant(id: oneFabricant, nameMachines: allMachines)
                        print(uploadFabricant)
                        //machineFabricantRepository.updateFabricant(uploadFabricant)
                    }
                } else {
                    //error
                }
            } catch {}
        }
    }
    
    func loadStock() {
        let baseURL = "\(userName):\(password)@\(ipNAS)"
        let url = URL(string: "\(baseURL)/stock%20macfordi.csv")  //sudo code: URL(string: "ftp://user:password@host:port/path")
        var data: Data? = nil
        if let anUrl = url {
            do {
                data = try Data(contentsOf: anUrl)
                //all fine with jsonData here
                if let allData = data {
                    let getData = csv(data: String(decoding: allData, as: UTF8.self))
                    for piece in getData {
                        csvData.allStock.append(Stock(reference: piece[0], designation: piece[1]))
                    }
                } else {
                    //error
                }
            } catch {
                //handle error
                let url = URL(fileURLWithPath: Bundle.main.path(forResource: "stock", ofType: "csv")!)
                data = try? Data(contentsOf: url)
                if let allData = data {
                    let getData = csv(data: String(decoding: allData, as: UTF8.self))
                    for piece in getData {
                        csvData.allStock.append(Stock(reference: piece[0], designation: piece[1]))
                    }
                } else {
                    //error
                }
                print(error)
            }
        }
    }
}

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}


