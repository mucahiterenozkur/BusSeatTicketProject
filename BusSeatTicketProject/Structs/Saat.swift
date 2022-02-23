//
//  Saat.swift
//  BusSeatTicketProject
//
//  Created by Mücahit Eren Özkur on 15.02.2022.
//

import Foundation

struct Saat: BilgiVerProtocol {
    
    var saat = 0
    var dakika = 0
    
    func yazdir () {
        print("Saat: \(saat):\(dakika)")
    }
}
