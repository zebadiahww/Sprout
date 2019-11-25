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
    
    init(title: String, message: String, isApproved: Bool) {
        self.title = title
        self.message = message
        self.isApproved = isApproved
    }
}
