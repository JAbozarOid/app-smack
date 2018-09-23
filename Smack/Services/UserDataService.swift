//
//  UserDataService.swift
//  Smack
//
//  Created by ARATEL on 9/23/18.
//  Copyright © 2018 ARATEL. All rights reserved.
//

import Foundation

// singeleton class - > saving data at the response of add user api - > include of id,avatarColor and .....
class UserDataService {
    
    static let instance = UserDataService()
    
    // when we use public at the first this means the other classes can access this variable just with set
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    
    // create set methods for above variables
    func setUserData(id: String,avatarColor: String,avatarName: String,email: String, name: String) {
        self.id = id
        self.avatarColor = avatarColor
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
    
}
