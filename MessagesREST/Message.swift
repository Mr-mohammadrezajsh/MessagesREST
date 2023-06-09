//
//  Message.swift
//  MessagesREST
//
//  Created by mohammadreza on 3/19/1402 AP.
//

import Foundation

final class Message :Codable {
    var id:Int?
    var message:String
    
    init(message: String) {
        self.message = message
    }
}
