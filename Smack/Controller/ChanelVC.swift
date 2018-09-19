//
//  ChanelVC.swift
//  Smack
//
//  Created by ARATEL on 9/19/18.
//  Copyright © 2018 ARATEL. All rights reserved.
//

import UIKit

class ChanelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // this lines of code show how much of SWRevealViewControll does shown - > the width of
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60 // this means all width except 60 point
    }

   

}
