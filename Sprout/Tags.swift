//
//  Tags.swift
//  Sprout
//
//  Created by Travis Wheeler on 11/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import Foundation

class Tags {
    var title: String
    var category: [String]
    
    init(title: String, category: [String]) {
        self.title = title
        self.category = category
    }
}
