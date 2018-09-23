//
//  CreateAccount.swift
//  Smack
//
//  Created by ARATEL on 9/20/18.
//  Copyright © 2018 ARATEL. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    //outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func createAccountPressed(_ sender: Any) {
        // another way to unwrapp the optinonal variable is guard
        guard let email = emailTxt.text , emailTxt.text != "" else {
            return
        }
        
        guard let pass = passwordTxt.text , passwordTxt.text != "" else {
            return
        }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                print("registered user")
            }
        }
    }
    
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
        
    }
    
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
        
    }
}
