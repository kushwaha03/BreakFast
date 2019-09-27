//
//  ForgotPassVC.swift
//  BreakFast
//
//  Created by karmaa lab on 25/09/19.
//  Copyright © 2019 GlamourMapp. All rights reserved.
//

import UIKit

class ForgotPassVC: UIViewController {
    
    @IBOutlet var email: UITextField!
    @IBOutlet var submitBTn: UIButton!
    var iscallForgotPw = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        email.clipsToBounds = true;
        email.layer.cornerRadius = 10.0;
        email.layer.borderWidth = 1;
        email.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1);
        submitBTn.layer.cornerRadius = 10.0
        submitBTn.layer.borderWidth = 1;
        submitBTn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1);
        
        email.attributedPlaceholder = NSAttributedString(string: "Email",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        email.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: email.frame.height))
        email.leftViewMode = .always
        
        self.hideKeyBoardTappedAround()
        
        //Mark:Hiding & Showing Keyboard Animation
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func doSendOTPBtn(_ sender: Any) {
        
        
//        if((self.email.text!).isEmpty) {
//            print("Please Enter a E-mail")
//            self.showAlertMessage(title: "Invalid Email", msg: "You have to must fill this field. Please try again.")
//
//        } else if(!Rules.validateEmail(self.email.text!)) {
//            print("Please Enter a Valid email")
//            self.showAlertMessage(title: "Invalid Email", msg: "You have entered an invalid Email. Please try again.")
//
//
//        } else {
//            let url = Config.api_base + "user/forgot/password/"
//            Alamofire.request(url, method: .post,  parameters: ["email": self.email.text!])
//                .responseJSON { (response) in
//                    if response.result.isSuccess {
//                        let json: JSON = JSON(response.result.value!)
//                        print(json)
//                        if let jsonD = response.result.value as? [String:Any]{
//
//                            if let token = jsonD["token"] as? String {
                                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "VerifyVC") as? VerifyVC
//                                vc?.token = token
//                                vc?.email = self.email.text!
//                                
                                vc!.iscallForgotPw = true
//
                                self.navigationController?.pushViewController(vc!, animated: true)
//
//                            } else {
//                                self.showAlertMessage(title: "Invalid Email", msg: "Sorry the email address you have entered does not seem to be registered. Please try again.")
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
