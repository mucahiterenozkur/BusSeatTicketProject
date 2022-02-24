//
//  SeferCell.swift
//  BusSeatTicketProject
//
//  Created by Mücahit Eren Özkur on 16.02.2022.
//

import UIKit

class SeferCell: UITableViewCell {
    
    @IBOutlet weak var departurePoint: UILabel!
    @IBOutlet weak var destinationPoint: UILabel!
    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //print("cell is created")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(model: SeferModel) {
        self.departurePoint.text = model.cikisNoktasi
        self.destinationPoint.text = model.varisNoktasi
        self.companyImage.image = UIImage(named: model.firmaImage)
        self.price.text = model.fiyat
        
    }
    
}
