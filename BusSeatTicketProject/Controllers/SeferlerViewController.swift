//
//  SeferlerViewController.swift
//  BusSeatTicketProject
//
//  Created by Mücahit Eren Özkur on 16.02.2022.
//

import Foundation
import UIKit

class SeferlerViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    static var departure = ""
    static var destination = ""
    
    var seferler = [SeferModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //tableView.backgroundColor = UIColor(hexString: "#73FF9A")
        //tableView.backgroundColor = UIColor(red: 69/255, green: 127/255, blue: 202/255, alpha: 1.0)
        tableView.backgroundColor = UIColor(hexString: "#5EBFFF")
        
        title = "Seferler"
        //view.backgroundColor = UIColor(hexString: "#73FF9A")
        //view.backgroundColor = UIColor(red: 69/255, green: 127/255, blue: 202/255, alpha: 1.0)
        view.backgroundColor = UIColor(hexString: "#5EBFFF")
        
        seferler.append(SeferModel(firmaImage: "metro", fiyat: "300 TL", cikisNoktasi: SeferlerViewController.departure, varisNoktasi: SeferlerViewController.destination))
        seferler.append(SeferModel(firmaImage: "pamukkale", fiyat: "250 TL", cikisNoktasi: SeferlerViewController.departure, varisNoktasi: SeferlerViewController.destination))
        seferler.append(SeferModel(firmaImage: "koc", fiyat: "350 TL", cikisNoktasi: SeferlerViewController.departure, varisNoktasi: SeferlerViewController.destination))
        seferler.append(SeferModel(firmaImage: "varan", fiyat: "200 TL", cikisNoktasi: SeferlerViewController.departure, varisNoktasi: SeferlerViewController.destination))
//        seferler.append(SeferModel(firmaImage: "ulusoy", fiyat: "200 TL", cikisNoktasi: cikis, varisNoktasi: varis))
//        seferler.append(SeferModel(firmaImage: "gularas", fiyat: "125 TL", cikisNoktasi: cikis, varisNoktasi: varis))
//        seferler.append(SeferModel(firmaImage: "unal", fiyat: "175 TL", cikisNoktasi: cikis, varisNoktasi: varis))
        
        //Register Cell
        self.tableView.register(UINib(nibName: "SeferCell", bundle: nil), forCellReuseIdentifier: "seferCell")
        
    }
}

extension SeferlerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return seferler.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "seferCell", for: indexPath) as! SeferCell
//        cell.backgroundColor = UIColor(hexString: "#64F5C5")
//        cell.backgroundColor = UIColor(hexString: "#FFFF3D")
        cell.backgroundColor = .white
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 20
        
        cell.configure(model: seferler[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "SeatViewController") as! SeatViewController
        
        print("Cell \(indexPath.row + 1) clicked")
        //self.navigationController?.pushViewController(vc, animated: true)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let cellSpacingHeight: CGFloat = 10
        return cellSpacingHeight
    }
    
    // Make the background color show through
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }
    
    
}