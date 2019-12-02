//
//  Goals.swift
//  Sprout
//
//  Created by Travis Wheeler on 11/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit


class Goal {
    var title: String
    var body: String
    var isComplete: Bool
    var isPrivate: Bool
    var isDaily: Bool
    var date: Date?
    var uuid: String
    var icon: String
    var iconColor: String
    
    init(title: String, body: String, isComplete: Bool = false, isPrivate: Bool, isDaily: Bool, date: Date?, uuid: String = UUID().uuidString, icon: String, iconColor: String) {
        self.title = title
        self.body = body
        self.isComplete = isComplete
        self.isPrivate = isPrivate
        self.isDaily = isDaily
        self.date = date
        self.uuid = uuid
        self.icon = icon
        self.iconColor = iconColor
    }
}

extension Goal: Equatable {
    static func == (lhs: Goal, rhs: Goal) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
