//
//  Tarih.swift
//  BusSeatTicketProject
//
//  Created by Mücahit Eren Özkur on 15.02.2022.
//

import Foundation

struct Tarih: BilgiVerProtocol {
    
    var gun = 1
    var ay = 1
    var yil = 2021
    
    func yazdir () {
        print("Tarih: \(gun)/\(ay)/\(yil)")
    }
}
