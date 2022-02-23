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
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var nameText = ""
    var surnameText = ""
    var idText = ""
    var seatNumbersText = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hexString: "#73FF9A")
        nameLabel.text = nameText
        surnameLabel.text = surnameText
        idLabel.text = idText
        seatNumbersLabel.text = seatNumbersText
        departureLabel.text = SeferlerViewController.cikis
        destinationLabel.text = SeferlerViewController.varis
        dateLabel.text = Bilet.shared.tarih
        timeLabel.text = Bilet.shared.saat

        ticketImageView.image = UIImage(named: "ticket")
        qrCodeImageView.image = UIImage(named: "qr")
        
    }
    

    @IBAction func goBackToMainMenu(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        let vcSeat = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SeatViewController") as! SeatViewController
        vcSeat.yeniSatilanKoltuklar += [1,3,5,7] //sıkıntı var
        vcSeat.secilenKoltuklar = []
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .partialCurl
        present(vc, animated: true, completion: nil)
    }
    
}
