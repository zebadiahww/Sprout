//
//  Tags.swift
//  Sprout
//
//  Created by Travis Wheeler on 11/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import Foundation

class Tag {
    var title: String
    var category: String
    var uuid: String
    var userIDs: [String]
    
    init(title: String, category: String, uuid: String = UUID().uuidString, userID: [String]) {
        self.title = title
        self.category = category
        self.uuid = uuid
        self.userIDs = userID
    }
}

extension Tag: Equatable {
    static func == (lhs: Tag, rhs: Tag) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
    
}
