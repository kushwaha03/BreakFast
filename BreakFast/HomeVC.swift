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
    @IBOutlet var yourLocationLbl: UILabel!
    
    @IBOutlet var homeItmTbl: UITableView!
    @IBOutlet var continuBtn: UIButton!
    var selectedCell:[Bool] = []
    var indexSelect = 0
    var isAddnRemoveCond = false
    var catArr = ["North Adda", "Kerla Adda", "Kannada Adda"]
    var catDiscArr = ["Northern India which include food of Jammu and Kashmir, Punjab, Chandigarh, Haryana, Himachal Pradesh, Rajasthan, Uttarakhand, Delhi, Uttar Pradesh and Bihar as well as central region like Madhya Pradesh.", "Kerala, a state in the south of India, is linked to its history, geography, demography and culture.", "Karnataka Food: Karnataka Famous Food For An Ultimate Culinary Journey. Neer Dosa. The word 'neer' means water in Tulu language. Korri Gassi. Korri means Chicken and Gassi means curry. Kundapura Koli Saaru. Mysore Masala Dosa. Allugedda. Mysore Pak. Coorg Pandi Curry."]
    override func viewDidLoad() {
        super.viewDidLoad()

         if let presentAddress = UserDefaults.standard.string(forKey: "presentAddress") {
        yourLocationLbl.text = presentAddress
        }

    }
    @objc func buttonClicked() {
        print("Button Clicked")
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "OrderConfirmVC") as! OrderConfirmVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func doSetLocation(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MapVC") as! MapVC
//        vc.iscallForgotPw = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func catDetails(sender:UIButton) {
        print("button tag is :",sender.tag)
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CatDetailsVC") as! CatDetailsVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        } else {
            return catArr.count

        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let Cell1 = tableView.dequeueReusableCell(withIdentifier: "offerCell") as? offerCell
            for i in  0..<5 {
                
                let offerbutton:UIButton = UIButton(frame: CGRect(x: xOffset, y: 5, width: 200, height: 150))
                self.xOffset = self.xOffset
                    + 10 + offerbutton.frame.width
                offerbutton.setImage(#imageLiteral(resourceName: "Coupon-4"), for: .normal)
                offerbutton.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
                Cell1?.offerV.addSubview(offerbutton)
            }
            return Cell1!


        }
        
        else {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? HomeCell
            Cell?.nmLbl.text = catArr[indexPath.row]
            Cell?.discLbl.text = catDiscArr[indexPath.row]
            Cell?.cellBtn.addTarget(self, action: #selector(catDetails(sender:)), for: .touchUpInside)
            
        return Cell!
        }
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
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
