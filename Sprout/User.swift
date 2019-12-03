//
//  Mentor.swift
//  Sprout
//
//  Created by Travis Wheeler on 11/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class User {
    let uid: String
    var name: String
    var bio: String
    var isMentor: Bool
    var profilePicture: UIImage?
    var pupils: [User : Tag]?
    var mentors: [User : Tag]?
    var tags: [Tag]?
    var goals: [Goal]?
    var requests: [Request]?
    var email: String
    var linkedInURL: String?
    var website: String?
    var blockedUsers: [String]?
    
    init(uid: String, name: String, bio: String, isMentor: Bool, profileImage: UIImage?  = nil, pupils: [User : Tag]? = nil, mentors: [User : Tag]? = nil, tags: [Tag]? = nil, goals: [Goal]? = nil, request: [Request]? = nil, email: String, linkedInURL: String? = nil, website: String? = nil, blockedUsers: [String]? = nil) {
        self.uid = uid
        self.name = name
        self.bio = bio
        self.isMentor = isMentor
        self.profilePicture = profileImage
        self.pupils = pupils
        self.mentors = mentors
        self.tags = tags
        self.requests = request
        self.email = email
        self.linkedInURL = linkedInURL
        self.website = website
        self.blockedUsers = blockedUsers
    }
}

extension User: Hashable {
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.uid == rhs.uid
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(self.uid)
    }
}
