//
//  Saat.swift
//  BusSeatTicketProject
//
//  Created by Mücahit Eren Özkur on 15.02.2022.
//

import Foundation

struct Time: GiveInformationProtocol {
    
    var hour = 0
    var minute = 0
    
    func printInformation () {
        print("Saat: \(hour):\(minute)")
    }
}
