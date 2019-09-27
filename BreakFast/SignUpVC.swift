//
//  SignUpVC.swift
//  BreakFast
//
//  Created by karmaa lab on 25/09/19.
//  Copyright © 2019 GlamourMapp. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet var Name: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var psswd: UITextField!
    @IBOutlet var signUpBTN: UIButton!
    @IBOutlet var socialV: UIView!
    @IBOutlet var loginBT: UIButton!
    @IBOutlet var termncondBT: UIButton!
    
    @IBOutlet var txtnBtnStckV: UIStackView!
    @IBOutlet var OTP: UITextField!
    @IBOutlet var chngPno: UIButton!
    @IBOutlet var otpRSD: UIButton!
    @IBOutlet var headerNav: UINavigationBar!
    @IBOutlet var otpV: UIView!
    
    var otpVhidden = false
    var submittedBtnOn:Bool = false
    var iconClick = true
    var Customer:Bool = false
    var Owner:Bool = false
    var manager:Bool = false
    var logistics:Bool = false
    var token = ""
    var url = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        signUpBTN.isHidden = true
        //        otpV.isHidden = true
        Name.clipsToBounds = true;
        Name.layer.cornerRadius = 10;
        Name.layer.borderWidth = 1;
        Name.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1);
        email.clipsToBounds = true;
        email.layer.cornerRadius = 10;
        email.layer.borderWidth = 1;
        email.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1);
        
        psswd.clipsToBounds = true
        psswd.layer.cornerRadius = 10.0;
        psswd.layer.borderWidth = 1;
        psswd.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1);
        
        //        OTP.layer.borderColor = UIColor.lightGray.cgColor
        //        OTP.clipsToBounds = true
        //        OTP.layer.cornerRadius = 10.0;
        //        OTP.layer.borderWidth = 1
        
        
        
        signUpBTN.layer.cornerRadius = 10.0
        signUpBTN.layer.borderWidth = 1;
        signUpBTN.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1);
        
        
        Name.attributedPlaceholder = NSAttributedString(string: "Full Name",
                                                                attributes: [NSAttributedString.Key.foregroundColor:UIColor.black])
        Name.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: Name.frame.height))
        Name.leftViewMode = .always
        
        email.attributedPlaceholder = NSAttributedString(string: "Email",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        email.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: email.frame.height))
        email.leftViewMode = .always
        
        psswd.attributedPlaceholder = NSAttributedString(string: "Password",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        psswd.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: psswd.frame.height))
        psswd.leftViewMode = .always
        
        //
        //        OTP.attributedPlaceholder = NSAttributedString(string: "Enter OTP",
        //                                                       attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        //        OTP.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: OTP.frame.height))
        //        OTP.leftViewMode = .always
        //
        
        
        //Mark:Hiding the keyboard(tap gesture)
        self.hideKeyBoardTappedAround()
        
        //Mark:Hiding & Showing Keyboard Animation
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
//        psswd.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        
        let yourAttributes1: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 14),
            .foregroundColor: UIColor.black,
            .underlineStyle: NSUnderlineStyle.single.rawValue]
        let attributeString1 = NSMutableAttributedString(string: "Log in",
                                                         attributes: yourAttributes1)
        loginBT.setAttributedTitle(attributeString1, for: .normal)
        
        let yourAttributes2: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 10),
            .foregroundColor: UIColor.black,
            .underlineStyle: NSUnderlineStyle.single.rawValue]
        let attributeString2 = NSMutableAttributedString(string: "Terms & Conditions",
                                                         attributes: yourAttributes2)
        termncondBT.setAttributedTitle(attributeString2, for: .normal)
        
        
        
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        signUpBTN.isHidden = true
        //        socialV.isHidden = false
        
        if !(psswd.text?.isEmpty)! {
            signUpBTN.isHidden = false
            //            socialV.isHidden = true
        }
        
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
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SignUpVC.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //MARK: This is for When we hit return in Keyboard it should hide
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
    
    
    
    @IBAction func doSignUpAct(_ sender: Any) {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "VerifyVC") as! VerifyVC
        
            self.navigationController?.pushViewController(vc, animated: true)
        
//        if((self.NmeTextField.text!).isEmpty) {
//            print("yes its invalid user name")
//            showAlertMessage(title: "Invalid Name", msg: "You have to must fill this field. Please try again.")
//
//        } else if(!Rules.validateUsername(name: NmeTextField.text!)) {
//            print("yes its invalid name")
//            showAlertMessage(title: "Invalid Name", msg: "You have entered an invalid User Name. Please try again.")
//        } else if((self.emailtextFiled.text!).isEmpty) {
//            print("you can't keep blank email")
//            showAlertMessage(title: "Invalid Email", msg: "You have to must fill this field. Please try again.")
//
//        } else if(!Rules.validateEmail(self.emailtextFiled.text!)) {
//            print("yes its invalid email")
//            showAlertMessage(title: "Invalid Email", msg: "You have entered an invalid Email. Please try again.")
//
//        } else if((self.psswd.text!).isEmpty) {
//            print("yes its invalid password")
//            showAlertMessage(title: "Invalid Password", msg: "You have to must fill this field. Please try again.")
//
//        }else {
//
//            url = Config.api_base + "user/register/"
//            Alamofire.request(url, method: .post,  parameters: ["email": self.emailtextFiled.text!, "password": self.psswd.text!, "name": self.NmeTextField.text!])
//                .responseJSON { (response) in
//                    if response.result.isSuccess {
//                        let json: JSON = JSON(response.result.value!)
//                        print(json)
//                        if let token = json["token"].string {
//                            let defaults = UserDefaults.standard
//                            defaults.set(token, forKey: "loginToken")
//                            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "OtpVerifyVC") as! OtpVerifyVC
//                            vc.token = token
//                            self.navigationController?.pushViewController(vc, animated: true)
//                        }
//                    } else {
//                        print("error")
//                    }
//            }
//        }
//
    }
    //    @IBAction func doResendCodeBtn(_ sender: Any) {
    //
    //        if Customer {
    //            url = Config.api_base + "customer/resend_otp/"
    //        } else if Owner {
    //            url = Config.api_base + "owner/resend_otp/"
    //        }else if manager {
    //            url = Config.api_base + "shop_manager/resend_otp/"
    //        }
    //        let headers: HTTPHeaders = [
    //            "Token": self.token
    //        ]
    //        //        let url = Config.api_base + "customer/resend_otp/"
    //        Alamofire.request(url, method: .post, headers:headers)
    //            .responseJSON { (response) in
    //                if response.result.isSuccess {
    //                    let json: JSON = JSON(response.result.value!)
    //                    print(json)
    //
    //                    self.showAlertMessage(title: "OTP Send ", msg: "we have sent  new Otp. Please check again.")
    //
    //
    //                } else {
    //                    print("error")
    //                }
    //        }
    //    }
    
    func showAlertMessage(title: String, msg: String) {
        let alert = UIAlertController(title:title , message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func DoLogin(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
        
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
