//
//  RoundedButton.swift
//  Smack
//
//  Created by ARATEL on 9/23/18.
//  Copyright © 2018 ARATEL. All rights reserved.
//

import UIKit

@IBDesignable // this is for seeing changes in mainStory at the real time
class RoundedButton: UIButton {
    
    // this class is for setting corner radious to button
    
    @IBInspectable var cornerRadious: CGFloat = 3.0 {
        didSet{
            self.layer.cornerRadius = cornerRadious
        }
    }
    
    // this method means when the app is run this method called at the design time
    override func awakeFromNib() {
        self.setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = cornerRadious
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
}
