//
//  SeatViewController.swift
//  BusSeatTicketProject
//
//  Created by Mücahit Eren Özkur on 18.02.2022.
//

import UIKit
import SCLAlertView

class SeatViewController: UIViewController {


    @IBOutlet weak var collectionView: UICollectionView!
    
    
    private var totalSeats = 55
    public static var soldSeats: [Int] = []
    public var recentlySoldSeats: [Int] = []
    var selectedSeats: [Int] = []
    var seatNumbers: [Int] = []
    
    
    var busSeatNumDict = [Int : String]()
    var pathWayNumber = Int()
    var seatNum = Int()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        collectionView.dataSource = self (did it from code)
//        collectionView.delegate = self (did it from code)
        
        //collectionView.backgroundColor = UIColor(hexString: "#73FF9A")
        //view.backgroundColor = UIColor(hexString: "#73FF9A")
//        collectionView.backgroundColor = UIColor(red: 69/255, green: 127/255, blue: 202/255, alpha: 1.0)
        collectionView.backgroundColor = UIColor(hexString: "#5EBFFF")
//        view.backgroundColor = UIColor(red: 69/255, green: 127/255, blue: 202/255, alpha: 1.0)
        view.backgroundColor = UIColor(hexString: "#5EBFFF")
        
        pathWayNumber = 2 // CENTER - PASSENGER CAN WALK
        seatNum = 1  // STARTING NUMBER
        for i in 0...totalSeats{
            
            if i == pathWayNumber // If it s centre, values empty to dictionary
            {
                if i == 52 {
                    busSeatNumDict[i] = String(seatNum)
                    seatNum = seatNum + 1
                }else {
                    busSeatNumDict[i] = ""
                    pathWayNumber = pathWayNumber + 5 // Position empty - 2,7,12,17,22 ...... like that
                }
                
                
            }
                
            else
            {
                busSeatNumDict[i] = String(seatNum)
                seatNum = seatNum + 1
            }

        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        for koltuk in recentlySoldSeats {
            SeatViewController.soldSeats.append(koltuk)
        }
        recentlySoldSeats.removeAll()
        collectionView.reloadData()
    }
    
    
    @IBAction func buyTickets(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CompleteInformationViewController") as! CompleteInformationViewController
        
        vc.modalPresentationStyle = .fullScreen
        for i in 0..<selectedSeats.count {
            vc.selectedSeats += "\(seatNumbers[i]) "
            print(selectedSeats[i])
            SeatViewController.soldSeats.append(selectedSeats[i])
        }
        
        present(vc, animated: true, completion: nil)
    }
    
    

}

extension SeatViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalSeats
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seatCell", for: indexPath) as? SeatCollectionViewCell{
            
            let text = busSeatNumDict[indexPath.row]
            cell.seatNumber.font = UIFont(name: "Chalkboard SE Bold", size: 17)
            cell.seatNumber.textColor = .black
            
            //cell.layer.borderColor = UIColor.black.cgColor
            //cell.layer.borderWidth = 2
           // cell.layer.cornerRadius = 8
            //cell.imageView.image = UIImage(named: "seat")
            
            if isSold(seatNumber: indexPath.row){
                //cell.backgroundColor = .gray
                cell.imageView.image = UIImage(named: "grayseat")
                
            } else if isSelected(seatNumber: indexPath.row + 1){
                //cell.backgroundColor = .green
                cell.imageView.image = UIImage(named: "greenseat")
                print(indexPath.row + 1)
            } else {
                //cell.backgroundColor = .white
                cell.imageView.image = UIImage(named: "seat")
            }

            cell.seatNumber.text = text
            if /*busSeatNumDict[indexPath.row] == "2" ||*/ text == "" {
                cell.contentView.alpha = 0
                cell.layer.borderColor = UIColor.white.cgColor
                cell.isUserInteractionEnabled = false
            }
            

            return cell

        } else {

            return UICollectionViewCell()

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as? SeatCollectionViewCell //to reach cell
        if cell?.imageView.image == UIImage(named: "seat") {
            
            if emptySeatOperations(index: indexPath.row, seatNumber: cell!.seatNumber.text!){
                print(indexPath.row)
                //cell?.backgroundColor = .green
                cell?.imageView.image = UIImage(named: "greenseat")
                //print(secilenKoltuklar.count)
                selectedSeats.append(indexPath.row)
                seatNumbers.append(Int(cell!.seatNumber.text!)!)
            }
            
        } else if cell?.imageView.image == UIImage(named: "grayseat") {
            
            //makeAlert(title: "Satıldı!", message: "Bu koltuk daha önce satıldı.")
            SCLAlertView().showInfo("Satıldı.", subTitle: "Bu koltuk daha önce satıldı.", closeButtonTitle: "Tamam")
            
        } else {
            
            if selectedSeatOperations(index: indexPath.row, seatNumber: cell!.seatNumber.text!) {
                //cell?.backgroundColor = .white
                cell?.imageView.image = UIImage(named: "seat")
                selectedSeats.removeAll(where: { $0 == indexPath.row})
                seatNumbers.removeAll(where: { $0 == Int(cell!.seatNumber.text!)! })
            }
            
        }
    }
    
    private func emptySeatOperations(index: Int, seatNumber: String) -> Bool{
        
        if selectedSeats.count > 4 {
            //makeAlert(title: "Maksimum sayıya eriştin.", message: "Alınabilecek maksimum koltuk sayısı 5.")
            SCLAlertView().showError("Daha fazla koltuk alamazsın.", subTitle: "Maksimum sayı 5tir.", closeButtonTitle: "Tamam")
            //SCLAlertView().showError("Daha fazla koltuk alamazsın.", subTitle: "Maksimum sayı 5tir.", closeButtonTitle: "Tamam", timeout: .none, colorStyle: 0xFFFFFF, colorTextButton: 0xFFFFFF, circleIconImage: nil, animationStyle: .topToBottom)
            return false
        } else {
            //secilenKoltuklar.append(index + 1)
            //koltukNumaralari.append(Int(seatNumber)!)
            return true
        }
    }
    
    private func selectedSeatOperations(index: Int, seatNumber: String) -> Bool{
        selectedSeats.removeAll{
            //$0 == (index + 1)
            $0 == Int(seatNumber)
        }
        return true
    }
}

extension SeatViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = (self.view.frame.width / 7)
        let height: CGFloat = (self.view.frame.width / 7)
        
        return CGSize(width: width, height: height)
    }
    
}

extension SeatViewController {
    
    private func makeAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        
        alert.addAction(okButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func isSold(seatNumber: Int) -> Bool {

        for seat in SeatViewController.soldSeats {
            if seatNumber == seat {
                return true
            }
        }

        return false
    }
    
    
    private func isSelected(seatNumber: Int) -> Bool {
        
        for seat in selectedSeats {
            if seatNumber == seat {
                return true
            }
        }
        
        return false
    }
    
}