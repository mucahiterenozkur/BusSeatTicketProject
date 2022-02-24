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
    @IBOutlet weak var departureSearchBar: UISearchBar!
    @IBOutlet weak var destinationSearchBar: UISearchBar!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var tableView: UITableView!
    
    var departurePoint = ""
    var destinationPoint = ""
    var activeTag = 0
    var mapKitSearch = MKLocalSearchCompleter()
    var searchResults = [MKLocalSearchCompletion]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //title = "."
        //view.backgroundColor = UIColor(hexString: "#73FF9A")
        //view.backgroundColor = UIColor(red: 69/255, green: 127/255, blue: 202/255, alpha: 1.0)
        view.backgroundColor = UIColor(hexString: "#5EBFFF")
        busImageView.image = UIImage(named: "person")
        
        mapKitSearch.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        departureSearchBar.delegate = self
        destinationSearchBar.delegate = self
        
        departureSearchBar.barTintColor = UIColor(hexString: "#64F5C5")
        departureSearchBar.backgroundImage = UIImage()
        departureSearchBar.searchTextField.font = UIFont(name: "Chalkboard SE", size: 20)
        departureSearchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Nereden gideceksiniz?", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        
        destinationSearchBar.barTintColor = UIColor(hexString: "#64F5C5")
        destinationSearchBar.backgroundImage = UIImage()
        destinationSearchBar.searchTextField.font = UIFont(name: "Chalkboard SE", size: 20)
        destinationSearchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Nereye gideceksiniz?", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        
//        tableView.backgroundColor = UIColor(hexString: "#73FF9A")
        tableView.backgroundColor = UIColor(hexString: "#45B4FF") //#45B4FF
        tableView.separatorColor = UIColor(hexString: "#45B4FF")
        tableView.layer.cornerRadius = 20
//        imageView?.backgroundColor = UIColor(hexString: "#F59F89")
//        imageView?.layer.cornerRadius = 30
        //imageView.isHidden = true

        
    }
    
    
    @IBAction func seferleriGor(_ sender: Any) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SeferlerViewController") as! SeferlerViewController
        
        if departureSearchBar.text?.contains(", ") != nil {
            let departure = departureSearchBar.text?.components(separatedBy: ", ")
            SeferlerViewController.departure = departure![0]
        }
        if destinationSearchBar.text?.contains(", ") != nil {
            let destination = destinationSearchBar.text?.components(separatedBy: ", ")
            SeferlerViewController.destination = destination![0]
        }
        
        getDateAndTime()
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        present(vc, animated: true, completion: nil)
    }
    
    func getDateAndTime () {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.string(from: datePicker.date)

        let calendar = datePicker.calendar
        let hour = String((calendar?.component(.hour, from: datePicker.date))!)
        var minute = String((calendar?.component(.minute, from: datePicker.date))!)
        
        if minute == "0" { minute += "0" }
        let time = "\(hour):\(minute)"
        
        Ticket.shared.date = date
        Ticket.shared.time = time
        
        self.view.endEditing(true)
        
    }
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
        cell.backgroundColor = UIColor(hexString: "#45B4FF")
        cell.textLabel?.text = searchResult.title
        cell.textLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.textLabel?.font = UIFont(name: "Chalkboard SE", size: 18)
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


