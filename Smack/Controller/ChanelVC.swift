//
//  ChanelVC.swift
//  Smack
//
//  Created by ARATEL on 9/19/18.
//  Copyright © 2018 ARATEL. All rights reserved.
//

import UIKit

class ChanelVC: UIViewController {
    
    //Outlets - > login button title change duration in app
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var userImg: CircleImage!
    
    // when we are in create account page when we want to to close the view we want to back the channel page and not in loginVC so we create an action
    @IBAction func prepareForUnwind(segue: UIStoryboard){}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // this lines of code show how much of SWRevealViewControll does shown - > the width of
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60 // this means all width except 60 point
        
        // to inform the user that something has changed we should set an observable to notification
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUserInfo()
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        if AuthService.instance.isLoggedIn {
            // show profile page
            let profile = ProfileVCViewController()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        }else{
             performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
       
    }
    
    @objc func userDataDidChange(_ notif: Notification){
        setupUserInfo()
        
    }
    
    func setupUserInfo() {
        // when user login or logout we want to show in this page
        if AuthService.instance.isLoggedIn {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            userImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor )
        }else{
            // if the user is not logedin
            loginBtn.setTitle("Login", for: .normal)
            userImg.image = UIImage(named: "menuProfileIcon")
            userImg.backgroundColor = UIColor.clear
        }
    }
    
    
    
}
