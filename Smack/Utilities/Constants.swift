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

// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"

// user defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
