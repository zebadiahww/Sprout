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
    static let requestSenderIDKey = "requestSenderID"
    static let mentorIDKey = "mentorID"
}

class Request {
    var title: String
    var message: String
    var isApproved: Bool
    var uuid: String
    var requestSenderID: String
    var mentorID: String
    var documentDictionary: [String : Any] {
        let dict: [String : Any] = [
            RequestConstants.titleKey : title,
            RequestConstants.messageKey : message,
            RequestConstants.isApprovedKey : isApproved,
            RequestConstants.uuidKey : uuid,
            RequestConstants.requestSenderIDKey : requestSenderID,
            RequestConstants.mentorIDKey : mentorID
        ]
        
        return dict
    }
    
    init(title: String, message: String, isApproved: Bool = false, uuid: String = UUID().uuidString, requestSenderID: String, mentorID: String) {
        self.title = title
        self.message = message
        self.isApproved = isApproved
        self.uuid = uuid
        self.requestSenderID = requestSenderID
        self.mentorID = mentorID
    }
}

extension Request {
    convenience init?(dictionary: [String : Any]) {
        guard let title = dictionary[RequestConstants.titleKey] as? String,
            let message = dictionary[RequestConstants.messageKey] as? String,
            let isApproved = dictionary[RequestConstants.isApprovedKey] as? Bool,
            let uuid = dictionary[RequestConstants.uuidKey] as? String,
            let requestSenderID = dictionary[RequestConstants.requestSenderIDKey] as? String,
            let mentorID = dictionary[RequestConstants.mentorIDKey] as? String
            else {return nil}
        
        self.init(title: title, message: message, isApproved: isApproved, uuid: uuid, requestSenderID: requestSenderID, mentorID: mentorID )
    }
}

extension Request: Equatable {
    static func == (lhs: Request, rhs: Request) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
