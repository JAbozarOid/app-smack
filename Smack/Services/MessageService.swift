//
//  MessageService.swift
//  Smack
//
//  Created by ARATEL on 10/20/18.
//  Copyright © 2018 ARATEL. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
    
    var channels = [Channel]()
    
    // we need a functions to get a request on api and bringup back the list of channels -> we don't need any parameters to pass the api
    func findAllChannel(completion: @escaping CompletionHandler){
        
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADERWithAUTH).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else {return}
                
                if let json = try! JSON(data: data).array{
                    for item in json {
                        let name = item["name"].stringValue
                        let channelDescription = item["description"].stringValue
                        let id = item["_id"].stringValue

                        // with these data that get from api we can create a channel object
                        let channel = Channel(channelTitle: name, channelDescription: channelDescription, id: id)

                        // add this channel object to channels array
                        self.channels.append(channel)
                    }
                    print(self.channels[0].channelTitle)
                     completion(true)
                }
                
                
            }else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
}
