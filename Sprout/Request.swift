//
//  Request.swift
//  Sprout
//
//  Created by Travis Wheeler on 11/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import Foundation

struct RequestConstants {
    static let typeKey = "Request"
    fileprivate static let titleKey = "title"
    fileprivate static let messageKey = "message"
    fileprivate static let isApprovedKey = "isApproved"
    fileprivate static let uuidKey = "uuid"
    static let userIDKey = "UserID"
}

class Request {
    var title: String
    var message: String
    var isApproved: Bool
    var uuid: String
    var userID: String
    var documentDictionary: [String : Any] {
        let dict: [String : Any] = [
            RequestConstants.titleKey : title,
            RequestConstants.messageKey : message,
            RequestConstants.isApprovedKey : isApproved,
            RequestConstants.uuidKey : uuid,
            RequestConstants.userIDKey : userID
        ]
        
        return dict
    }
    
    init(title: String, message: String, isApproved: Bool = false, uuid: String = UUID().uuidString, userID: String) {
        self.title = title
        self.message = message
        self.isApproved = isApproved
        self.uuid = uuid
        self.userID = userID
    }
}

extension Request {
    convenience init?(dictionary: [String : Any]) {
        guard let title = dictionary[RequestConstants.titleKey] as? String,
            let message = dictionary[RequestConstants.messageKey] as? String,
            let isApproved = dictionary[RequestConstants.isApprovedKey] as? Bool,
            let uuid = dictionary[RequestConstants.uuidKey] as? String,
            let userID = dictionary[RequestConstants.userIDKey] as? String
            else {return}
        
        self.init(title: title, message: message, isApproved: isApproved, uuid: uuid, userID: userID )
    }
}

extension Request: Equatable {
    static func == (lhs: Request, rhs: Request) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
