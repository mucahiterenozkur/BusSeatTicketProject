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

        backgroundImageView.image = UIImage(named: "landscape")
        bottomView.backgroundColor = .white
        bottomView.layer.cornerRadius = 30
        
        titleLbl.numberOfLines = 0
        titleLbl.text = "Türkiye'nin her şehrine giden otobüsleri sıralayan Benim Otobüsüm'e hoşgeldin! \n Hadi başlayalım!"
        titleLbl.font = UIFont(name: "Chalkboard SE", size: 30)
        
        startButton.setTitle("Biletini al!", for: .normal)
        startButton.backgroundColor = .green
        startButton.layer.cornerRadius = 20
        startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 70)

    }
    
    
    @IBAction func startButtonAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    

}
