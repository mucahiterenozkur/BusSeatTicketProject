//
//  SeferCell.swift
//  BusSeatTicketProject
//
//  Created by Mücahit Eren Özkur on 16.02.2022.
//

import UIKit

class SeferCell: UITableViewCell {
    
    @IBOutlet weak var cikisNoktasi: UILabel!
    @IBOutlet weak var varisNoktasi: UILabel!
    @IBOutlet weak var firmaImage: UIImageView!
    @IBOutlet weak var fiyat: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("cell is created")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(model: SeferModel) {
        self.cikisNoktasi.text = model.cikisNoktasi
        self.varisNoktasi.text = model.varisNoktasi
        self.firmaImage.image = UIImage(named: model.firmaImage)
        self.fiyat.text = model.fiyat
        
    }
    
}
