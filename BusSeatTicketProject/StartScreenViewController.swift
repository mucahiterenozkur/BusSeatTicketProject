//
//  StartScreenViewController.swift
//  BusSeatTicketProject
//
//  Created by Mücahit Eren Özkur on 21.02.2022.
//

import UIKit

class StartScreenViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImageView.image = UIImage(named: "world")
        bottomView.backgroundColor = UIColor(hexString: "#73FF9A")
        bottomView.layer.cornerRadius = 30
        
        titleLbl.numberOfLines = 0
        titleLbl.text = "Dünyanın her şehrine otobüs bileti alabileceğin Benim Otobüsüm'e hoşgeldin! \n Hadi başlayalım!"
        titleLbl.textColor = UIColor(hexString: "#1E77B3")
        titleLbl.font = UIFont(name: "Chalkboard SE", size: 30)
        
//        startButton.setTitle("Biletini al!", for: .normal)
        //startButton.backgroundColor = UIColor(hexString: "#FF7373")
        startButton.layer.cornerRadius = 20
        //startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.font = UIFont(name: "Comic Sans MS", size: 25)
        startButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
    }
    
    
    @IBAction func startButtonAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    

}
