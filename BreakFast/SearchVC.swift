//
//  SearchVC.swift
//  BreakFast
//
//  Created by karmaa lab on 26/09/19.
//  Copyright © 2019 GlamourMapp. All rights reserved.
//

import UIKit

class SearchVC: UIViewController,UITextFieldDelegate {

    @IBOutlet var searchTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        searchTxt.clipsToBounds = true;
        searchTxt.layer.cornerRadius = 10.0;
        searchTxt.layer.borderWidth = 1;
        searchTxt.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1);
        
        searchTxt.attributedPlaceholder = NSAttributedString(string: "Search",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        searchTxt.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: searchTxt.frame.height))
        searchTxt.leftViewMode = .always
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
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
