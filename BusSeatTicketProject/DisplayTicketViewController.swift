//
//  DisplayTicketViewController.swift
//  BusSeatTicketProject
//
//  Created by Mücahit Eren Özkur on 21.02.2022.
//

import UIKit

class DisplayTicketViewController: UIViewController {

    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTField: UITextField!
    @IBOutlet weak var surnameTField: UITextField!
    @IBOutlet weak var tcNoTField: UITextField!
    @IBOutlet weak var selectedSeatsLabel: UILabel!
    var selectedSeats = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        selectedSeatsLabel.text = selectedSeats
        
        imageView.backgroundColor = .systemBlue
        imageView.layer.cornerRadius = 20
        
        profileImageView.image = UIImage(named: "user")
        
        
    }
    

    

}
