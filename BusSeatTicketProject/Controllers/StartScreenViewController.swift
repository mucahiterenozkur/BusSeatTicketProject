//
//  StartScreenViewController.swift
//  BusSeatTicketProject
//
//  Created by Mücahit Eren Özkur on 21.02.2022.
//

import UIKit

class StartScreenViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImageView.image = UIImage(named: "world")
        view.backgroundColor = UIColor(hexString: "#5EBFFF")
        
        titleLbl.numberOfLines = 0
        titleLbl.text = "Dünyanın her şehrine otobüs bileti alabileceğin Benim Otobüsüm'e hoşgeldin! \n Hadi başlayalım!"
        titleLbl.textColor = .white
        titleLbl.font = UIFont(name: "Chalkboard SE", size: 30)
        
        startButton.titleLabel?.font = UIFont(name: "Chalkboard SE Bold", size: 23)
        startButton.layer.cornerRadius = 20
        
    }
    
    
    @IBAction func startButtonAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    

}
