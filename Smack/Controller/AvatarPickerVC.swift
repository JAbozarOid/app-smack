//
//  AvatarPickerVC.swift
//  Smack
//
//  Created by ARATEL on 10/4/18.
//  Copyright © 2018 ARATEL. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentControll: UISegmentedControl!
    
    //Variables
    var avatarType = AvatarType.dark // set as defualt
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCell {
            cell.configureCell(index: indexPath.item, type: avatarType)
            return cell
        }
        return AvatarCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }

    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // handle switch between dark and light avatar
    @IBAction func segmentControllChanged(_ sender: Any) {
        if segmentControll.selectedSegmentIndex == 0 {
            avatarType = .dark
        }else {
            avatarType = .light
        }
        collectionView.reloadData()
    }
    
    // for show items in different sizes we should calculate the size of screen
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var numofColumns: CGFloat = 3
        if UIScreen.main.bounds.width > 320 {
            numofColumns = 4
        }
        
        let spaceBetweenCells: CGFloat = 10
        let padding : CGFloat = 40
        let cellDimension = ((collectionView.bounds.width - padding) - (numofColumns - 1) * spaceBetweenCells) / numofColumns
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    // function for select an avatar
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // each avatar selected by user save it in shared prefrence in this example UserDataService and loaded in image view in
        if avatarType == .dark {
            UserDataService.instance.setAvatarName(avatarName: "dark\(indexPath.item)")
        }else{
            UserDataService.instance.setAvatarName(avatarName: "light\(indexPath.item)")
        }
        self.dismiss(animated: true , completion: nil)
    }
    
    
    
    
    
    
}
