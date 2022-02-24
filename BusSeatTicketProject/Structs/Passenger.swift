//
//  Yolcu.swift
//  BusSeatTicketProject
//
//  Created by Mücahit Eren Özkur on 15.02.2022.
//

import Foundation

struct Passenger: GiveInformationProtocol {
    var name = ""
    var surname = ""
    var id = 0
    
    func printInformation() {
        print("Yolcu adı: \(name) Yolcu soyadı: \(surname) Yolcu id: \(id)")
    }
    
    
}
