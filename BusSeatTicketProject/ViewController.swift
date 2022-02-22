//
//  ViewController.swift
//  BusSeatTicketProject
//
//  Created by Mücahit Eren Özkur on 15.02.2022.
//

import UIKit
import MapKit

class ViewController: UIViewController {


    @IBOutlet weak var busImageView: UIImageView!
//    @IBOutlet weak var neredenGidecekTField: UITextField!
//    @IBOutlet weak var nereyeGidecekTField: UITextField!
    
    @IBOutlet weak var departureSearchBar: UISearchBar!
    @IBOutlet weak var destinationSearchBar: UISearchBar!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var cikisNoktasi = ""
    var varisNoktasi = ""
    
    var activeTag = 0
    var mapKitSearch = MKLocalSearchCompleter()
    var searchResults = [MKLocalSearchCompletion]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //title = "."
        view.backgroundColor = UIColor(hexString: "#64F5C5")
        busImageView.image = UIImage(named: "person")
        
        mapKitSearch.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        departureSearchBar.delegate = self
        destinationSearchBar.delegate = self
        
        departureSearchBar.barTintColor = UIColor(hexString: "#64F5C5")
        departureSearchBar.backgroundImage = UIImage()
        destinationSearchBar.barTintColor = UIColor(hexString: "#64F5C5")
        destinationSearchBar.backgroundImage = UIImage()
        tableView.backgroundColor = UIColor(hexString: "#64F5C5")
        tableView.separatorColor = UIColor(hexString: "#64F5C5")
        
//        imageView?.backgroundColor = UIColor(hexString: "#F59F89")
//        imageView?.layer.cornerRadius = 30
        //imageView.isHidden = true

        
    }
    
    
    @IBAction func seferleriGor(_ sender: Any) {
//        self.cikisNoktasi = neredenGidecekTField.text!
//        self.varisNoktasi = nereyeGidecekTField.text!
//        performSegue(withIdentifier: "seferler", sender: self)
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SeferlerViewController") as! SeferlerViewController
//        vc.cikis = neredenGidecekTField.text!
//        vc.varis = nereyeGidecekTField.text!
        
        if departureSearchBar.text?.contains(", ") != nil {
            let departure = departureSearchBar.text?.components(separatedBy: ", ")
            SeferlerViewController.cikis = departure![0]
        }
        
        if destinationSearchBar.text?.contains(", ") != nil {
            let destination = destinationSearchBar.text?.components(separatedBy: ", ")
            SeferlerViewController.varis = destination![0]
        }
        
        //vc.cikis = departureSearchBar.text!
        //vc.varis = destinationSearchBar.text!
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

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchResult = searchResults[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath)
        //cell.backgroundColor = #colorLiteral(red: 0.93323493, green: 0.9333916306, blue: 0.9332129359, alpha: 1)
        cell.backgroundColor = UIColor(hexString: "#64F5C5")
        cell.textLabel?.text = searchResult.title
        cell.textLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let searchResult = searchResults[indexPath.row]
        
        if activeTag == 0 {
            
            departureSearchBar.text = searchResult.title
        }
        
        else if activeTag == 1 {
            
            destinationSearchBar.text = searchResult.title
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        searchResults.removeAll()
        tableView.reloadData()
        
    }
}


extension ViewController: MKLocalSearchCompleterDelegate {
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
        tableView.reloadData()
    }
    
    
}

extension ViewController:UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        mapKitSearch.queryFragment = searchText
        
        activeTag = searchBar.tag
    }
    
}


