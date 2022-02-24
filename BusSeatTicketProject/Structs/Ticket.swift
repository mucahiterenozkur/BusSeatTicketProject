//
//  Bilet.swift
//  BusSeatTicketProject
//
//  Created by Mücahit Eren Özkur on 15.02.2022.
//

import Foundation

struct Ticket: GiveInformationProtocol {
    
    static var shared = Ticket()
    
    var passenger: Passenger?
    var date: String?
    var time: String?
    var seat: [Int]?
    var reservedSeat = 0
    
    func compareTickets(ticket: Ticket) -> Bool {
        if !seat!.isEmpty {
            for i in 0 ..< ticket.seat!.count {
                if seat!.contains(ticket.seat![i]) {
                    return true
                }
            }
            return false
        }
        return false
    }
    
    func reserveSeat(seat: Int) -> [Int] {
        if reservedSeat > 0 {
            return self.seat!
        } else {
            let tempArray = repeatElement(0, count: seat)
            let tempIntArray = tempArray.map{(Int($0))}
            return tempIntArray
        }
    }
    
    mutating func addSeat(willReserveSeat: Int) {
        seat!.append(willReserveSeat)
    }
    
    func printInformation() {
        print(passenger as Any)
        print(date as Any)
        print(time as Any)
        print(seat as Any)
    }
}
