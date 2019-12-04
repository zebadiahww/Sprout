//
//  Mentor.swift
//  Sprout
//
//  Created by Travis Wheeler on 11/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

struct UserConstants {
    fileprivate static let uuidKey = "uuid"
    fileprivate static let nameKey = "name"
    fileprivate static let bioKey = "bio"
    fileprivate static let isMentorKey = "isMentor"
    fileprivate static let occupationKey = "occupation"
    fileprivate static let linkedInKey = "linkedInURL"
    fileprivate static let websiteKey = "websiteURL"
    fileprivate static let blockedUsersKey = "blockedUsers"
}

class User {
    let uuid: String
    var name: String
    var bio: String
    var occupation: String?
    var isMentor: Bool
    var profilePicture: UIImage?
    var pupils: [User : Tag]?
    var mentors: [User : Tag]?
    var tags: [Tag]?
    var goals: [Goal]?
    var requests: [Request]?
    var linkedInURL: String?
    var website: String?
    var blockedUsers: [String]?
    var documentDictionary: [String : Any] {
        var dict: [String : Any] = [
            UserConstants.uuidKey : uuid,
            UserConstants.nameKey : name,
            UserConstants.bioKey : bio,
            UserConstants.isMentorKey : isMentor
        ]
        if let occupation = occupation {
            dict.updateValue(occupation, forKey: UserConstants.occupationKey)
        }
        if let linkedInURL = linkedInURL {
            dict.updateValue(linkedInURL, forKey: UserConstants.linkedInKey)
        }
        if let website = website {
            dict.updateValue(website, forKey: UserConstants.websiteKey)
        }
        if let blockedUsers = blockedUsers {
            dict.updateValue(blockedUsers, forKey: UserConstants.blockedUsersKey)
        }
        
        return dict
    }
    
    init(uuid: String, name: String, bio: String, occupation: String?, isMentor: Bool, profileImage: UIImage? = nil, pupils: [User : Tag]? = nil, mentors: [User : Tag]? = nil, tags: [Tag]? = nil, goals: [Goal]? = nil, request: [Request]? = nil, linkedInURL: String?, website: String?, blockedUsers: [String]? = nil) {
        
        self.uuid = uuid
        self.name = name
        self.bio = bio
        self.occupation = occupation
        self.isMentor = isMentor
        self.profilePicture = profileImage
        self.pupils = pupils
        self.mentors = mentors
        self.tags = tags
        self.requests = request
        self.linkedInURL = linkedInURL
        self.website = website
        self.blockedUsers = blockedUsers
    }
}

extension User {
    convenience init?(dictionary: [String : Any]) {
        guard let uuid = dictionary[UserConstants.uuidKey] as? String,
            let name = dictionary[UserConstants.nameKey] as? String,
            let bio = dictionary[UserConstants.bioKey] as? String,
            let isMentor = dictionary[UserConstants.isMentorKey] as? Bool
            else {return nil}
        let occupation = dictionary[UserConstants.occupationKey] as? String
        let linkedInURL = dictionary[UserConstants.linkedInKey] as? String
        let website = dictionary[UserConstants.websiteKey] as? String
        let blockedUsers = dictionary[UserConstants.blockedUsersKey] as? [String]
        
        self.init(uuid: uuid, name: name, bio: bio, occupation: occupation, isMentor: isMentor, linkedInURL: linkedInURL, website: website, blockedUsers: blockedUsers)
    }
}

extension User: Hashable {
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(self.uuid)
    }
}
