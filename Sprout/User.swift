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
    var pupil: [User : Tag]?
    var mentor: [User : Tag]?
    var tags: [Tag]?
    var goals: [Goal]?
    var requests: [Request]?
    var email: String
    var password: String
    var linkedIn: Bool
    var facebook: Bool
    var blockedUsers: [String]?
    
    init(uid: String, name: String = "", bio: String = "", isMentor: Bool = false, profileImage: UIImage? = nil, pupil: [User : Tag]? = nil, mentor: [User : Tag]? = nil, tags: [Tag]? = nil, goals: [Goal]? = nil, request: [Request]? = nil, email: String, password: String = "", linkedIn: Bool = false, facebook: Bool = false, blockedUsers: [String]? = nil) {
        self.uid = uid
        self.name = name
        self.bio = bio
        self.isMentor = isMentor
        self.profilePicture = profileImage
        self.pupil = pupil
        self.mentor = mentor
        self.tags = tags
        self.requests = request
        self.email = email
        self.password = password
        self.linkedIn = linkedIn
        self.facebook = facebook
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
