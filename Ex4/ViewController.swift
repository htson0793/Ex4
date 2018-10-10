//
//  ViewController.swift
//  Ex4
//
//  Created by Hoang Son on 10/8/18.
//  Copyright © 2018 Hoang Son. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var designButton: UIButton!
    
    let database:Dictionary<String,String> = ["email" : "htson0793@gmail.com", "password" : "123"]
    override func viewDidLoad() {
        super.viewDidLoad()
        designButton.layer.cornerRadius = designButton.frame.height/2
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func btnLogin(_ sender: Any) {
        let logEmail = self.txtEmail.text
        let localEmail = self.database["email"]
        
        let logPassword = self.txtPassword.text
        let localPassword = self.database["password"]
        
        guard (logEmail, logPassword) == (localEmail, localPassword) else
        {
            print("")
            return
        }
        self.performSegue(withIdentifier: "showMain", sender: self)
       
    }
    
    
    @IBAction func btnSignup(_ sender: Any) {
        self.performSegue(withIdentifier: "signupMain", sender: self)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

