//
//  Bilet.swift
//  BusSeatTicketProject
//
//  Created by Mücahit Eren Özkur on 15.02.2022.
//

import Foundation

struct Bilet: BilgiVerProtocol {
    
    static var shared = Bilet()
    
    var yolcu: Yolcu?
    var tarih: String?
    var saat: String?
    var koltuk: [Int]?
    var ayirtilanKoltuk = 0
    
    func karsilastir(bilet: Bilet) -> Bool {
        if !koltuk!.isEmpty {
            for i in 0 ..< bilet.koltuk!.count {
                if koltuk!.contains(bilet.koltuk![i]) {
                    return true
                }
            }
            return false
        }
        return false
    }
    
    func koltukAyir(koltuk: Int) -> [Int] {
        if ayirtilanKoltuk > 0 {
            return self.koltuk!
        } else {
            let tempArray = repeatElement(0, count: koltuk)
            let tempIntArray = tempArray.map{(Int($0))}
            return tempIntArray
        }
    }
    
    mutating func koltukEkle(ayirilacakKoltuk: Int) {
        koltuk!.append(ayirilacakKoltuk)
    }
    
    func yazdir() {
        print(yolcu as Any)
        print(tarih as Any)
        print(saat as Any)
        print(koltuk as Any)
    }
}
