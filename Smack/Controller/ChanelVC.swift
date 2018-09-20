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
    
    // when we are in create account page when we want to to close the view we want to back the channel page and not in loginVC so we create an action
    @IBAction func prepareForUnwind(segue: UIStoryboard){}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // this lines of code show how much of SWRevealViewControll does shown - > the width of
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60 // this means all width except 60 point
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
    
    
}
