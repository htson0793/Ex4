//
//  SignupViewController.swift
//  Ex4
//
//  Created by Hoang Son on 10/9/18.
//  Copyright © 2018 Hoang Son. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtUsername: DesignTextField!
    
    @IBOutlet weak var txtEmail: DesignTextField!
    
    @IBOutlet weak var txtPhone: DesignTextField!
    
    @IBOutlet weak var txtPassword: DesignTextField!
    
    @IBOutlet weak var thongBao: UILabel!
    
    @IBOutlet weak var designButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUsername.delegate = self
        txtEmail.delegate = self
        txtPhone.delegate = self
        txtPassword.delegate = self
        thongBao.isHidden = true
        designButton.layer.cornerRadius = designButton.frame.height/2
        // Do any additional setup after loading the view.
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.shadowColor = UIColor.blue.cgColor
        textField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        textField.layer.shadowOpacity = 1.0
        textField.layer.shadowRadius = 0.0
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.shadowColor = UIColor.white.cgColor
        textField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        textField.layer.shadowOpacity = 1.0
        textField.layer.shadowRadius = 0.0
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.txtEmail.resignFirstResponder()
        
        return true
    }
    @IBAction func btnRegister(_ sender: Any) {
        thongBao.isHidden = true
        guard let username = txtUsername.text, txtUsername.text?.characters.count != 0 else {
            thongBao.isHidden = false
            thongBao.text = "Please enter your username"
            return
            
        }
        guard let email = txtEmail.text, txtEmail.text?.characters.count != 0  else {
            thongBao.isHidden = false
            thongBao.text = "Please enter your email"
            return
        }
        
        guard let phone = txtPhone.text, txtPhone.text?.characters.count != 0 else {
            thongBao.isHidden = false
            thongBao.text = "Please enter your phone"
            return
            
        }
        guard let password = txtPassword.text, txtPassword.text?.characters.count != 0 else {
            thongBao.isHidden = false
            thongBao.text = "Please enter your password"
            return
        }
        if isValidEmail(emailID: email) == false {
            thongBao.isHidden = false
            thongBao.text = "Please enter valid email address"
        }
        if validate(value: phone) == false {
            thongBao.isHidden = false
            thongBao.text = "Please enter valid phone number"
        }
        if isValidPincode(value: password) == false {
            thongBao.isHidden = false
            thongBao.text = "Please enter valid password"
            
        }
    }
    func isValidEmail(emailID: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailID)
    }
    func validate(value: String) -> Bool {
        let PHONE_REGEX = "^((\\+)|(84))[0-9]{9,12}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    func isValidPincode(value: String) -> Bool {
        let passwordRegEx = "[A-Z0-9a-z]{6}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        let result = passwordTest.evaluate(with: value)
        return result
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
