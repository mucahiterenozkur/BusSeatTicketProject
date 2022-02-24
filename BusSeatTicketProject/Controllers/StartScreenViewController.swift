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
        //view.backgroundColor = UIColor(hexString: "#73FF9A")
        view.backgroundColor = UIColor(hexString: "#5EBFFF")
        //view.backgroundColor = UIColor(red: 69/255, green: 127/255, blue: 202/255, alpha: 1.0) // blue
        //view.backgroundColor = UIColor(red: 166/255, green: 172/255, blue: 236/255, alpha: 1.0) // purple
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
