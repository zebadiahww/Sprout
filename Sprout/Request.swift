//
//  Request.swift
//  Sprout
//
//  Created by Travis Wheeler on 11/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import Foundation

class Request {
    var title: String
    var message: String
    var isApproved: Bool
    var uuid: String
    var userID: String
    
    init(title: String, message: String, isApproved: Bool = false, uuid: String = UUID().uuidString, userID: String) {
        self.title = title
        self.message = message
        self.isApproved = isApproved
        self.uuid = uuid
        self.userID = userID
    }
}

extension Request: Equatable {
    static func == (lhs: Request, rhs: Request) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
