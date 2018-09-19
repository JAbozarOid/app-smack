//
//  ChatVC.swift
//  Smack
//
//  Created by ARATEL on 9/19/18.
//  Copyright © 2018 ARATEL. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    // Outlet
    @IBOutlet weak var menuBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // for btn menu we create action and target notice atat the first of define it is just outlet - > when click on hamburger button show the drawer or chanel menu
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        // *** these two lines are for user drag the menu to left or right the menu appear -> that means menu works both click on icon and drag
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        
        
    }

    

}
