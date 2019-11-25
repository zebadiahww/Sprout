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
    
    init(title: String, body: String, isComplete: Bool, isPupil: Bool) {
        self.title = title
        self.body = body
        self.isComplete = isComplete
        self.isPupil = isPupil
    }
}

class GoalsLongTerm {
    var title: String
    var body: String
    var isComplete: Bool
    var isPupil: Bool
    var date: Date
    
    init(title: String, body: String, isComplete: Bool, isPupil: Bool, date: Date) {
        self.title = title
        self.body = body
        self.isComplete = isComplete
        self.isPupil = isPupil
        self.date = date
    }
}
