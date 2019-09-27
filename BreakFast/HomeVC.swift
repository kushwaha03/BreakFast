//
//  HomeVC.swift
//  BreakFast
//
//  Created by karmaa lab on 25/09/19.
//  Copyright © 2019 GlamourMapp. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var xOffset:CGFloat = 10

    @IBOutlet var ordrContinueV: UIView!
    
    @IBOutlet var homeItmTbl: UITableView!
    @IBOutlet var continuBtn: UIButton!
    var selectedCell:[Bool] = []
    var indexSelect = 0
    var isAddnRemoveCond = false
    var ItemArr = ["Poha", "Kachori", "samosa"]
    override func viewDidLoad() {
        super.viewDidLoad()
        continuBtn.layer.cornerRadius = 20
        
        ordrContinueV.isHidden = true
        ordrContinueV.layer.borderWidth = 0.5
        ordrContinueV.layer.borderColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        
        
//        // Do any additional setup after loading the view.
//        ForOffer()
    }
//    func ForOffer() {
//         for i in  0..<5 {
//
//        let offerbutton:UIButton = UIButton(frame: CGRect(x: xOffset, y: 5, width: 200, height: 120))
//        self.xOffset = self.xOffset
//            + 10 + offerbutton.frame.width
////        offerbutton.backgroundColor = .green
//            offerbutton.setImage(#imageLiteral(resourceName: "Coupon-4"), for: .normal)
////        offerbutton.setTitle("Button", for: .normal)
//        offerbutton.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
//        self.offerV.addSubview(offerbutton)
//        }
//
//
//    }
    @objc func buttonClicked() {
        print("Button Clicked")
    }
    
    
    @IBAction func doSetLocation(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MapVC") as! MapVC
//        vc.iscallForgotPw = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func addItemInOrdr(sender:UIButton) {
        print("button tag is :",sender.tag)
//        selectedCell[sender.tag] = !selectedCell[sender.tag]
//
//        self.selectedCell = [Bool](repeating: false, count: 5)
        indexSelect = sender.tag
        self.homeItmTbl.reloadData()
        if !isAddnRemoveCond {
        ordrContinueV.isHidden = false
            isAddnRemoveCond = true
        } else {
            ordrContinueV.isHidden = true
            isAddnRemoveCond = false
        }
        
        
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        } else {
            return 5

        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let Cell1 = tableView.dequeueReusableCell(withIdentifier: "offerCell") as? offerCell
            for i in  0..<5 {
                
                let offerbutton:UIButton = UIButton(frame: CGRect(x: xOffset, y: 5, width: 200, height: 120))
                self.xOffset = self.xOffset
                    + 10 + offerbutton.frame.width
                //        offerbutton.backgroundColor = .green
                offerbutton.setImage(#imageLiteral(resourceName: "Coupon-4"), for: .normal)
                //        offerbutton.setTitle("Button", for: .normal)
                offerbutton.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
                Cell1?.offerV.addSubview(offerbutton)
            }
            return Cell1!


        }
        
        else {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? HomeCell
            if isAddnRemoveCond && indexSelect == indexPath.row{
               Cell?.addItmBtn.setTitle("     Remove", for: .normal)
                Cell?.addItmImg.image = #imageLiteral(resourceName: "icons8-subtract-24(1)")
                Cell?.addItmBtn.setTitleColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), for: .normal)

            } else {
                Cell?.addItmBtn.setTitle("Add", for: .normal)
                Cell?.addItmImg.image = #imageLiteral(resourceName: "ice-cream-24")
                Cell?.addItmBtn.setTitleColor(#colorLiteral(red: 0, green: 0.6850365996, blue: 0.9128597379, alpha: 1), for: .normal)

            }
             Cell?.addItmBtn.tag = indexPath.row
        Cell?.addItmBtn.addTarget(self, action: #selector(addItemInOrdr(sender:)), for: .touchUpInside)
        return Cell!
        }
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return ""
        }else if section == 1{
          return "North Adda"
        } else if section == 2{
             return "Kerla Adda"
        } else {
            return "Kanada Adda"
        }
        return nil
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
