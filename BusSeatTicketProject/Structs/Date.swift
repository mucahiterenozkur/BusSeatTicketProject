//
//  Tarih.swift
//  BusSeatTicketProject
//
//  Created by Mücahit Eren Özkur on 15.02.2022.
//

import Foundation

struct Date: GiveInformationProtocol {
    
    var day = 1
    var month = 1
    var year = 2021
    
    func printInformation () {
        print("Tarih: \(day)/\(month)/\(year)")
    }
}
