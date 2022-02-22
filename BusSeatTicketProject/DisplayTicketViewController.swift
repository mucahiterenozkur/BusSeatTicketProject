//
//  DisplayTicketViewController.swift
//  BusSeatTicketProject
//
//  Created by Mücahit Eren Özkur on 22.02.2022.
//

import UIKit

class DisplayTicketViewController: UIViewController {

    
    @IBOutlet weak var ticketImageView: UIImageView!
    
    @IBOutlet weak var departureLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var seatNumbersLabel: UILabel!
    @IBOutlet weak var qrCodeImageView: UIImageView!
    
    
    var nameText = ""
    var surnameText = ""
    var idText = ""
    var seatNumbersText = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = nameText
        surnameLabel.text = surnameText
        idLabel.text = idText
        seatNumbersLabel.text = seatNumbersText
        departureLabel.text = SeferlerViewController.cikis
        destinationLabel.text = SeferlerViewController.varis

        ticketImageView.image = UIImage(named: "ticket")
        qrCodeImageView.image = UIImage(named: "qr")
        
    }
    

    
}
