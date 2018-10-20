//
//  ProfileVCViewController.swift
//  Smack
//
//  Created by ARATEL on 10/15/18.
//  Copyright © 2018 ARATEL. All rights reserved.
//

import UIKit

class ProfileVCViewController: UIViewController {

   //outlets
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

     @IBAction func closedModelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    
    @IBAction func logoutPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    
    func setupView(){
        
        // set the username , email and photo
        username.text = UserDataService.instance.name
        email.text = UserDataService.instance.email
        profileImg.image = UIImage(named: UserDataService.instance.avatarName)
        profileImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(closeTap(_ :)))
        
        // when we create tap recognizer we must add to view
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
    
}
