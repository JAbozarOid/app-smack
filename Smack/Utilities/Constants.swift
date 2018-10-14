//
//  Constants.swift
//  Smack
//
//  Created by ARATEL on 9/20/18.
//  Copyright © 2018 ARATEL. All rights reserved.
//

import Foundation

// create custom clousure type of variable in swift
typealias CompletionHandler = (_ Success: Bool) -> ()
// examples of typealias
//typealias Jonny = String
//let name: Jonny = "Jonny"

// url constants
let BASE_URL = "https://app-chat-ios.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

// colors
let smackPurplePlaceholder = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)

// notification constant
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")

// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"

// user defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
let TO_AVATAR_PICKER = "toAvatarPicker"

// Headers
let HEADER = [
    "Content-Type" : "application/json; charset=utf-8"
]

let HEADERWithAUTH = [
    "Authorization":"Bearer \(AuthService.instance.authToken)",
    "Content-Type" : "application/json; charset=utf-8"
]
