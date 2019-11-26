//
//  Goals.swift
//  Sprout
//
//  Created by Travis Wheeler on 11/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import Foundation

class Goal {
    var title: String
    var body: String
    var isComplete: Bool
    var date: Date?
    var uuid: String
    
    init(title: String, body: String, isComplete: Bool = false, date: Date? = Date(), uuid: String = UUID().uuidString) {
        self.title = title
        self.body = body
        self.isComplete = isComplete
        self.date = date
        self.uuid = uuid
    }
}

extension Goal: Equatable {
    static func == (lhs: Goal, rhs: Goal) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
    
}
