//
//  MapVC.swift
//  BreakFast
//
//  Created by karmaa lab on 26/09/19.
//  Copyright © 2019 GlamourMapp. All rights reserved.
//

import UIKit

class MapVC: UIViewController {

    @IBOutlet var nxtBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nxtBtn.layer.cornerRadius = 20
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func goBack(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
}
