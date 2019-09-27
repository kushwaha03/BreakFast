//
//  ChangePassVC.swift
//  BreakFast
//
//  Created by karmaa lab on 25/09/19.
//  Copyright © 2019 GlamourMapp. All rights reserved.
//

import UIKit

class ChangePassVC: UIViewController {
    
    @IBOutlet var newPass: UITextField!
    @IBOutlet var confirmPass: UITextField!
    
    
    @IBOutlet var submitBTn: UIButton!
    var token = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        newPass.clipsToBounds = true;
        newPass.layer.cornerRadius = 10.0;
        newPass.layer.borderWidth = 1;
        newPass.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1);
        confirmPass.clipsToBounds = true;
        confirmPass.layer.cornerRadius = 10.0;
        confirmPass.layer.borderWidth = 1;
        confirmPass.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1);
        submitBTn.layer.cornerRadius = 10.0
        submitBTn.layer.borderWidth = 1;
        submitBTn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1);
        
        
        newPass.attributedPlaceholder = NSAttributedString(string: "New Password",
                                                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        newPass.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: newPass.frame.height))
        newPass.leftViewMode = .always
        
        confirmPass.attributedPlaceholder = NSAttributedString(string: "Confirm Password",
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        confirmPass.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: newPass.frame.height))
        confirmPass.leftViewMode = .always
        
        self.hideKeyBoardTappedAround()
        
        //Mark:Hiding & Showing Keyboard Animation
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func doSubmitBtn(_ sender: Any) {
//
//        if((self.newPass.text!).isEmpty) {
//            print("yes its invalid password")
//            showAlertMessage(title: "Invalid Password", msg: "You have to must fill this field. Please try again.")
//        }else if((self.confirmPass.text!).isEmpty) {
//            print("yes its invalid password")
//            showAlertMessage(title: "Invalid Confirm Password", msg: "You have to must fill this field. Please try again.")
//        } else if(!(self.confirmPass.text == self.newPass.text)) {
//            print("password doesnt match")
//            showAlertMessage(title: "Invalid Password", msg: "You have to must fill same password. Please try again.")
//        } else {
//
//            let headers: HTTPHeaders = [
//                "Token": token
//            ]
//
//            let url = Config.api_base + "user/reset/password/"
//            Alamofire.request(url, method: .post,  parameters: ["password": self.confirmPass.text!], headers: headers)
//                .responseJSON { (response) in
//                    if response.result.isSuccess {
//                        let json: JSON = JSON(response.result.value!)
//                        print(json)
//                        if let jsonD = response.result.value as? [String:Any]{
//
//                            if let profileD = jsonD["token"] as? String {
//                                print(profileD)
                                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
//
                                self.navigationController?.pushViewController(vc!, animated: true)
//
//
//                            } else {
//                                //                            Validate.showMessage(title: "Invalid Email", msg: "Sorry the email address you have entered does not seem to be registered. Please try again.")
//
//                            }
//
//                        }
//
//                    } else {
//                        print("error")
//                    }
//            }
//        }
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        if self.view.frame.origin.y==0 {
            self.view.frame.origin.y -= 50
        }
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            
            self.view.frame.origin.y += 50
        }
        
    }
    
    
    
    func hideKeyBoardTappedAround() {
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginVC.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    func showAlertMessage(title: String, msg: String) {
        
        let alert = UIAlertController(title:title , message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
