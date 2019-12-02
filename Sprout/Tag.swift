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
    var uuid: String
    
    init(title: String, uuid: String = UUID().uuidString) {
        self.title = title
        self.uuid = uuid
    }
}

extension Tag: Equatable {
    static func == (lhs: Tag, rhs: Tag) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
    
}
