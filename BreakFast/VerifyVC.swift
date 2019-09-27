//
//  VerifyVC.swift
//  BreakFast
//
//  Created by karmaa lab on 25/09/19.
//  Copyright © 2019 GlamourMapp. All rights reserved.
//

import UIKit

class VerifyVC: UIViewController {
    
    @IBOutlet var otp: UITextField!
    @IBOutlet var submitBTn: UIButton!
    var token = ""
    var email = ""
    var iscallForgotPw = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        otp.clipsToBounds = true;
        otp.layer.cornerRadius = 10.0;
        otp.layer.borderWidth = 1;
        otp.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1);
        submitBTn.layer.cornerRadius = 10.0
        submitBTn.layer.borderWidth = 1;
        submitBTn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1);
        
        otp.attributedPlaceholder = NSAttributedString(string: "Otp",
                                                       attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        otp.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: otp.frame.height))
        otp.leftViewMode = .always
        
        self.hideKeyBoardTappedAround()
        
        //Mark:Hiding & Showing Keyboard Animation
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
        
        
        
        
        
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
    
    
    @IBAction func doSubmitBtn(_ sender: Any) {
        if iscallForgotPw {
//            if((self.otp.text!).isEmpty) {
//                self.showAlertMessage(title: "Invalid otp", msg: "You have to must fill this field. Please try again.")
//
//            } else {
//                let  url = Config.api_base + "user/forgot/password_verify/"
//                Alamofire.request(url, method: .post,  parameters: ["otp": self.otp.text!, "email": email ])
//                    .responseJSON { (response) in
//                        if response.result.isSuccess {
//                            let json: JSON = JSON(response.result.value!)
//                            print(json)
//                            if let jsonD = response.result.value as? [String:Any]{
//
//                                if let token = json["token"].string {
//                                    print(token)
                                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ChangePassVC") as! ChangePassVC
//                                    vc.token = token
//
                                    self.navigationController?.pushViewController(vc, animated: true)
//                                } else {
//                                    self.showAlertMessage(title: "Invalid Otp", msg: "You have entered an invalid Otp. Please try again.")
//
//                                }
//
//                            }
//
//                        } else {
//                            print("error")
//                        }
//                }
//            }
        }
//        else  {
//            
//            let headers: HTTPHeaders = [
//                "Token": self.token
//            ]
//            if((self.otp.text!).isEmpty) {
//                self.showAlertMessage(title: "Invalid otp", msg: "You have to must fill this field. Please try again.")
//                
//            } else {
//                
//                let url = Config.api_base + "/user/verify_email/"
//                Alamofire.request(url, method: .post,  parameters: ["otp": self.otp.text!], headers:headers)
//                    .responseJSON { (response) in
//                        if response.result.isSuccess {
//                            let json: JSON = JSON(response.result.value!)
//                            print(json)
//                            if let jsonD = response.result.value as? [String:Any]{
//                                if let token = json["token"].string {
//                                    let defaults = UserDefaults.standard
//                                    defaults.set(token, forKey: "loginToken")
//                                }
//                                if let user = jsonD["user"] as? [String:Any] {
//                                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "dashTabBVC") as! dashTabBVC
//                                    print("yes comming")
//                                    self.navigationController?.pushViewController(vc, animated: true)
//                                } else {
//                                    self.showAlertMessage(title: "Invalid Otp", msg: "You have entered an invalid Otp. Please try again.")
//                                    
//                                }
//                            }
//                            
//                        } else {
//                            print("error")
//                        }
//                }
//            }
//        }
        
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
