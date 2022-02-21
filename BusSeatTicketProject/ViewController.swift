//
//  ViewController.swift
//  BusSeatTicketProject
//
//  Created by Mücahit Eren Özkur on 15.02.2022.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var busImageView: UIImageView!
    @IBOutlet weak var neredenGidecekTField: UITextField!
    @IBOutlet weak var nereyeGidecekTField: UITextField!
    
    var cikisNoktasi = ""
    var varisNoktasi = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //title = "."
        view.backgroundColor = UIColor(hexString: "#64F5C5")        
        busImageView.image = UIImage(named: "person")
        
//        imageView?.backgroundColor = UIColor(hexString: "#F59F89")
//        imageView?.layer.cornerRadius = 30
        //imageView.isHidden = true

        
    }
    
    
    @IBAction func seferleriGor(_ sender: Any) {
//        self.cikisNoktasi = neredenGidecekTField.text!
//        self.varisNoktasi = nereyeGidecekTField.text!
//        performSegue(withIdentifier: "seferler", sender: self)
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SeferlerViewController") as! SeferlerViewController
        vc.cikis = neredenGidecekTField.text!
        vc.varis = nereyeGidecekTField.text!
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        present(vc, animated: true, completion: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        var vc = segue.destination as! SeferlerViewController
//        vc.cikis = self.cikisNoktasi
//        vc.varis = self.varisNoktasi
//    }
    

}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

