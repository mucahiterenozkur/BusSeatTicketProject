//
//  DisplayTicketViewController.swift
//  BusSeatTicketProject
//
//  Created by Mücahit Eren Özkur on 21.02.2022.
//

import UIKit

class CompleteInformationViewController: UIViewController {

    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTField: UITextField!
    @IBOutlet weak var surnameTField: UITextField!
    @IBOutlet weak var tcNoTField: UITextField!
    @IBOutlet weak var selectedSeatsLabel: UILabel!
    var selectedSeats = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = UIColor(hexString: "#73FF9A")
        //view.backgroundColor = UIColor(red: 69/255, green: 127/255, blue: 202/255, alpha: 1.0)
        view.backgroundColor = UIColor(hexString: "#5EBFFF")
        selectedSeatsLabel.text = selectedSeats
        imageView.backgroundColor = UIColor(hexString: "#45B4FF")
        imageView.layer.cornerRadius = 20
        
        nameTField.font = UIFont(name: "Chalkboard SE", size: 20)
        surnameTField.font = UIFont(name: "Chalkboard SE", size: 20)
        tcNoTField.font = UIFont(name: "Chalkboard SE", size: 20)
        
        profileImageView.image = UIImage(named: "user")
        
    }
    

    @IBAction func displayTicket(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DisplayTicketViewController") as! DisplayTicketViewController
        
        vc.nameText = nameTField.text!
        vc.surnameText = surnameTField.text!
        vc.idText = tcNoTField.text!
        vc.seatNumbersText = selectedSeatsLabel.text!
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
        
    }
    

}