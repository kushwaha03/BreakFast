//
//  LoginVC.swift
//  BreakFast
//
//  Created by karmaa lab on 25/09/19.
//  Copyright © 2019 GlamourMapp. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    @IBOutlet var socialV: UIView!
    @IBOutlet var logoIMG: UIImageView!
    @IBOutlet var email: UITextField!
    @IBOutlet var psswd: UITextField!
    @IBOutlet var loginBT: UIButton!
    @IBOutlet var forgetPswd: UIButton!
    @IBOutlet var RegisterBT: UIButton!
    @IBOutlet var termsnconBT: UIButton!
    
    var iconClick:Bool = false
    
    var url = ""
    let yourAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.boldSystemFont(ofSize: 14),
        .foregroundColor: UIColor.black,
        .underlineStyle: NSUnderlineStyle.single.rawValue]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        email.clipsToBounds = true;
        email.layer.cornerRadius = 10.0;
        email.layer.borderWidth = 1;
        email.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1);
        psswd.clipsToBounds = true
        psswd.layer.cornerRadius = 10.0;
        psswd.layer.borderWidth = 1;
        psswd.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1);
        
        loginBT.layer.cornerRadius = 10.0
        loginBT.layer.borderWidth = 1;
        loginBT.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1);
        
        email.attributedPlaceholder = NSAttributedString(string: "Email",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        email.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: email.frame.height))
        email.leftViewMode = .always
        
        psswd.attributedPlaceholder = NSAttributedString(string: "Password",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        psswd.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: psswd.frame.height))
        psswd.leftViewMode = .always
        
        //Mark:Hiding the keyboard(tap gesture)
        self.hideKeyBoardTappedAround()
        
        //Mark:Hiding & Showing Keyboard Animation
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
//        psswd.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        let attributeString = NSMutableAttributedString(string: "Click Here",
                                                        attributes: yourAttributes)
        forgetPswd.setAttributedTitle(attributeString, for: .normal)

        let attributeString1 = NSMutableAttributedString(string: "Sign up",
                                                         attributes: yourAttributes)
        RegisterBT.setAttributedTitle(attributeString1, for: .normal)
        
        let yourAttributes2: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 10),
            .foregroundColor: UIColor.black,
            .underlineStyle: NSUnderlineStyle.single.rawValue]
        let attributeString2 = NSMutableAttributedString(string: "Terms & Conditions",
                                                         attributes: yourAttributes2)
        termsnconBT.setAttributedTitle(attributeString2, for: .normal)
        
        
//        if let loginToken = UserDefaults.standard.string(forKey: "loginToken") {
//
//            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "dashTabBVC") as! dashTabBVC
//            //            vc.token = loginToken
//
//
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        }
        
    }
    
//    @objc func textFieldDidChange(_ textField: UITextField) {
//        loginBT.isHidden = true
//        socialV.isHidden = false
//
//        if !(psswd.text?.isEmpty)! {
//            loginBT.isHidden = false
//            socialV.isHidden = true
//        }
//
//    }
    
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
    
    
    
    
    
    //MARK: This is for When we hit return in Keyboard it should hide
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
    //
    //
    @IBAction func forgotPwssd(_ sender: Any) {

        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ForgotPassVC") as! ForgotPassVC
        vc.iscallForgotPw = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    //
    @IBAction func login(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DashTabBVC") as! DashTabBVC

                self.navigationController?.pushViewController(vc, animated: true)

//        if((self.email.text!).isEmpty)
//        {
//            print("You can't keep Email Blank")
//            showAlertMessage(title: "Invalid Email", msg: "You must fill this field. Please try again.")
//
//        }
//
//        else if(!Rules.validateEmail(self.email.text!))
//        {
//            print("Invalid email")
//            showAlertMessage(title: "Invalid Email", msg: "You have entered an invalid Email. Please try again.")
//
//
//        }
//
//        else if((self.psswd.text!).isEmpty)
//        {
//
//            print("Invalid password")
//            showAlertMessage(title: "Invalid Password", msg: "Please Enter A Strong Password & try again.")
//
//
//        }
//
//        else {
//            //              self.navigationController?.pushViewController(vc, animated: true)
//
//
//            let url = Config.api_base + "user/login/"
//            Alamofire.request(url, method: .post,  parameters: ["email": self.email.text!, "password": self.psswd.text!])
//                .responseJSON { (response) in
//                    if response.result.isSuccess {
//                        let json: JSON = JSON(response.result.value!)
//                        print(json)
//
//                        if let token = json["token"].string {
//                            let defaults = UserDefaults.standard
//                            defaults.set(token, forKey: "loginToken")
//                            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "dashTabBVC") as! dashTabBVC
//                            //                            vc.token = token
//                            self.navigationController?.pushViewController(vc, animated: true)
//
//                        }
//                        else {
//
//                            self.showAlertMessage(title: "Invalid Credential", msg: "Sorry the email address you have entered does not seem to be registered. Please sign up instead!")
//
//                        }
//
//                    }
//                    else {
//                        print("error")
//                    }
//            }
//        }
    }
    //    @IBAction func eye(_ sender: Any) {
    //        if(iconClick == true) {
    //            psswd.isSecureTextEntry = false
    //        } else {
    //            psswd.isSecureTextEntry = true
    //        }
    //
    //        iconClick = !iconClick
    //    }
    //
    @IBAction func Register(_ sender: Any) {

        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
//    func showAlertMessage(title: String, msg: String) {
//
//        let alert = UIAlertController(title:title , message: msg, preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//    }
    
    
    
}
