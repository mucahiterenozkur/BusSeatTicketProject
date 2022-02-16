//
//  Yolcu.swift
//  BusSeatTicketProject
//
//  Created by Mücahit Eren Özkur on 15.02.2022.
//

import Foundation

struct Yolcu: BilgiVerProtocol {
    var isim = ""
    var soyisim = ""
    var id = 0
    
    func yazdir() {
        print("Yolcu adı: \(isim) Yolcu soyadı: \(soyisim) Yolcu id: \(id)")
    }
    
    
}
