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
    var cikis = ""
    var varis = ""
    
    var seferler = [SeferModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        title = "Seferler"
        view.backgroundColor = .white
        
        
        
        seferler.append(SeferModel(firmaImage: "metro", fiyat: "300 TL", cikisNoktasi: cikis, varisNoktasi: varis))
        seferler.append(SeferModel(firmaImage: "pamukkale", fiyat: "250 TL", cikisNoktasi: cikis, varisNoktasi: varis))
        seferler.append(SeferModel(firmaImage: "koc", fiyat: "350 TL", cikisNoktasi: cikis, varisNoktasi: varis))
        seferler.append(SeferModel(firmaImage: "ulusoy", fiyat: "200 TL", cikisNoktasi: cikis, varisNoktasi: varis))
        seferler.append(SeferModel(firmaImage: "gularas", fiyat: "125 TL", cikisNoktasi: cikis, varisNoktasi: varis))
        seferler.append(SeferModel(firmaImage: "unal", fiyat: "175 TL", cikisNoktasi: cikis, varisNoktasi: varis))
        
        //Register Cell
        self.tableView.register(UINib(nibName: "SeferCell", bundle: nil), forCellReuseIdentifier: "seferCell")
        
    }
}

extension SeferlerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seferler.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "seferCell", for: indexPath) as! SeferCell
        cell.configure(model: seferler[indexPath.row])
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
        return 100
    }
    
    
    
}
