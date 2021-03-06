//
//  AuthService.swift
//  Smack
//
//  Created by ARATEL on 9/23/18.
//  Copyright © 2018 ARATEL. All rights reserved.
//

import Foundation
import Alamofire //Alamofire is a library for webrequest
import SwiftyJSON // for working with parsing json responses


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
        
        let body: [String: Any] = [
            "email":lowerCaseEmail,
            "password":password
        ]
        
        // for most particular respose is a json but for this case the respose is a string so we select string response
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString
            {(response) in
                
                if response.result.error == nil {
                    completion(true)
                }else {
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
            }
    }
    
    // create a method to handle login api - > in this api we pass email and password as body request and header content type with application json
    func loginUser(email: String,password: String,completion: @escaping CompletionHandler) {
        
        // web request is a async which means when we send a request we don't know when the response is comeback
        
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email":lowerCaseEmail,
            "password":password
        ]
        
        // for most particular respose is a json but for this case the respose is a string so we select string response
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON {
            (response) in
            
            
            // if there is n't any errors -> successfull response
            if response.result.error == nil {
                
                //using swifty json for parsing json response
                guard let data = response.data else {return}
                let json = try! JSON(data: data) // *** with try! force unwrap the result
                self.userEmail = json["user"].stringValue
                self.authToken = json["token"].stringValue
                
                self.isLoggedIn=true
                completion(true)
                
            }else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func createUser(name: String,email: String,avatarName: String,avatarColor: String,completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "name": name,
            "email":lowerCaseEmail,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        // header for this web request is a little bit different we have both "content-type" and "token"
        
        Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADERWithAUTH).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else {return}
                self.setUserInfo(data: data)
                completion(true)
                
            }else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    
    func findUserByEmail(completion: @escaping CompletionHandler) {
        
        // we just need header and no body
        Alamofire.request("\(URL_USER_ADD)\(userEmail)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADERWithAUTH).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else {return}
                self.setUserInfo(data: data)
                completion(true)
                
            }else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
            
        }
        
    }
    
    func setUserInfo(data: Data) {
        let json = try! JSON(data: data)
        let id = json["_id"].stringValue // string value don't let if the valuse is nill the app doesn't crash
        let name = json["name"].stringValue
        let email = json["email"].stringValue
        let avatarName = json["avatarName"].stringValue
        let avatarColor = json["avatarColor"].stringValue
        
        UserDataService.instance.setUserData(id: id, avatarColor: avatarColor, avatarName: avatarName, email: email, name: name)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
