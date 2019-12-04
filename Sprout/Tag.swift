//
//  Tags.swift
//  Sprout
//
//  Created by Travis Wheeler on 11/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import Foundation

struct TagConstants {
    static let typeKey = "Tag"
    fileprivate static let uuidKey = "uuid"
    static let titleKey = "title"
    fileprivate static let categoryKey = "category"
    static let userIDsKey = "userIDs"
}

class Tag {
    var uuid: String
    var title: String
    var category: String
    var userIDs: [String]?
    
    var documentDictionary: [String:Any] {
        var dict: [String:Any] = [
            TagConstants.uuidKey : uuid,
            TagConstants.titleKey : title,
            TagConstants.categoryKey : category,
        ]
        if let userIDs = userIDs {
            dict.updateValue(userIDs, forKey: TagConstants.userIDsKey)
        }
            
        
        return dict
    }
    
    init(uuid: String = UUID().uuidString, title: String, category: String, userIDs: [String]? = nil) {
        self.title = title
        self.category = category
        self.uuid = uuid
        self.userIDs = userIDs
    }
}

extension Tag {
    convenience init?(dictionary: [String:Any]) {
        guard let uuid = dictionary[TagConstants.uuidKey] as? String,
            let title = dictionary[TagConstants.titleKey] as? String,
            let category = dictionary[TagConstants.categoryKey] as? String
        else {return nil}
        let userIDs = dictionary[TagConstants.userIDsKey] as? [String]
        
        self.init(uuid: uuid, title: title, category: category, userIDs: userIDs)
    }
}

extension Tag: Equatable {
    static func == (lhs: Tag, rhs: Tag) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
