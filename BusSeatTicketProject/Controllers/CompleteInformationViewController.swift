//
//  DisplayTicketViewController.swift
//  BusSeatTicketProject
//
//  Created by Mücahit Eren Özkur on 21.02.2022.
//

import UIKit
import SCLAlertView

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

        view.backgroundColor = UIColor(hexString: "#5EBFFF")
        
        imageView.backgroundColor = UIColor(hexString: "#45B4FF")
        imageView.layer.cornerRadius = 20
        
        selectedSeatsLabel.text = selectedSeats
        
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
        
        if nameTField.text!.isEmpty || surnameTField.text!.isEmpty || tcNoTField.text!.isEmpty {
            let string = "#FF7373"
            SCLAlertView().showError("Eksik Bilgi", subTitle: "Ad, soyad veya id girilmedi.", closeButtonTitle: "Tamam", colorStyle: UInt(String(string.suffix(6)), radix: 16)!)
        } else {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
        
        
    }
}
