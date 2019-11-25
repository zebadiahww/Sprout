//
//  Goals.swift
//  Sprout
//
//  Created by Travis Wheeler on 11/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import Foundation

class Goals {
    var shortTerm: [GoalsShortTerm]
    var longTerm: [GoalsLongTerm]
    
    init(shortTerm: [GoalsShortTerm], longTerm: [GoalsLongTerm]) {
        self.shortTerm = shortTerm
        self.longTerm = longTerm
    }
}

class GoalsShortTerm {
    var title: String
    var body: String
    var isComplete: Bool
    var isPupil: Bool
}

class GoalsLongTerm {
    var title: String
    var body: String
    var isComplete: Bool
    var isPupil: Bool
    
}
