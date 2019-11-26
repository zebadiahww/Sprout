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
    
    init(title: String, message: String, isApproved: Bool = false, uuid: String = UUID().uuidString) {
        self.title = title
        self.message = message
        self.isApproved = isApproved
        self.uuid = uuid
    }
}

extension Request: Equatable {
    static func == (lhs: Request, rhs: Request) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
