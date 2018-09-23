//
//  AuthService.swift
//  Smack
//
//  Created by ARATEL on 9/23/18.
//  Copyright © 2018 ARATEL. All rights reserved.
//

import Foundation
import Alamofire //Alamofire is a library for webrequest


// this class is a singleton class and it should lounch once at the app run
class AuthService {
    
    static let instance = AuthService()
    
    // saving data in app - > this is the most simplest way to save data
    let defaults = UserDefaults.standard
    
    // for checking user login or not
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken : String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String // casted to string beacause of method value return any?
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail : String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    
    // create a method to handle register api - > in this api we pass email and password as body request and header content type with application json
    func registerUser(email: String,password: String,completion: @escaping CompletionHandler) {
        
        // web request is a async which means when we send a request we don't know when the response is comeback
        
        let lowerCaseEmail = email.lowercased()
        
        let header = [
            "Content-Type" : "application/json; charset=utf-8"
        ]
        
        let body: [String: Any] = [
            "email":lowerCaseEmail,
            "password":password
        ]
        
        // for most particular respose is a json but for this case the respose is a string so we select string response
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString
            {(response) in
                
                if response.result.error == nil {
                    completion(true)
                }else {
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
            }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
