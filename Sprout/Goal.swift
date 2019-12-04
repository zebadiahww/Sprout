//
//  Goals.swift
//  Sprout
//
//  Created by Travis Wheeler on 11/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

struct GoalConstants {
    static let typeKey = "Goal"
    fileprivate static let titleKey = "title"
    fileprivate static let bodyKey = "body"
    static let userIDKey = "userID"
    fileprivate static let isCompleteKey = "isComplete"
    fileprivate static let isPrivateKey = "isPrivate"
    fileprivate static let isDailyKey = "isDaily"
    fileprivate static let dateKey = "date"
    fileprivate static let uuidKey = "uuid"
    fileprivate static let iconKey = "icon"
    fileprivate static let iconColorKey = "iconColor"
}

class Goal {
    var title: String
    var body: String
    var userID: String
    var isComplete: Bool
    var isPrivate: Bool
    var isDaily: Bool
    var date: Date?
    var uuid: String
    var icon: String
    var iconColor: String
    var documentDictionary: [String : Any] {
        var dict: [String : Any] = [
            GoalConstants.titleKey : title,
            GoalConstants.bodyKey : body,
            GoalConstants.userIDKey : userID,
            GoalConstants.isCompleteKey : isComplete,
            GoalConstants.isPrivateKey : isPrivate,
            GoalConstants.isDailyKey : isDaily,
            GoalConstants.uuidKey : uuid,
            GoalConstants.iconKey : icon,
            GoalConstants.iconColorKey : iconColor
        ]
        if let date = date {
            dict.updateValue(date, forKey: GoalConstants.dateKey)
        }
        return dict
    }
    
    init(title: String, body: String, userID: String, isComplete: Bool = false, isPrivate: Bool, isDaily: Bool, date: Date?, uuid: String = UUID().uuidString, icon: String, iconColor: String) {
        self.title = title
        self.body = body
        self.userID = userID
        self.isComplete = isComplete
        self.isPrivate = isPrivate
        self.isDaily = isDaily
        self.date = date
        self.uuid = uuid
        self.icon = icon
        self.iconColor = iconColor
    }
}

extension Goal {
    convenience init?(dictionay: [String : Any]) {
        guard let title = dictionay[GoalConstants.titleKey] as? String,
            let body = dictionay[GoalConstants.bodyKey] as? String,
            let userID = dictionay[GoalConstants.userIDKey] as? String,
            let isComplete = dictionay[GoalConstants.isCompleteKey] as? Bool,
            let isPrivate = dictionay[GoalConstants.isPrivateKey] as? Bool,
            let isDaily = dictionay[GoalConstants.isDailyKey] as? Bool,
            let uuid = dictionay[GoalConstants.uuidKey] as? String,
            let icon = dictionay[GoalConstants.iconKey] as? String,
            let iconColor = dictionay[GoalConstants.iconColorKey] as? String
            else {return nil}
        let date = dictionay[GoalConstants.dateKey] as? Date
        
        self.init(title: title, body: body, userID: userID, isComplete: isComplete, isPrivate: isPrivate, isDaily: isDaily, date: date, uuid: uuid, icon: icon, iconColor: iconColor)
    }
}

extension Goal: Equatable {
    static func == (lhs: Goal, rhs: Goal) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
