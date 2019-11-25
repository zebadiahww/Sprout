//
//  Pupil.swift
//  Sprout
//
//  Created by Travis Wheeler on 11/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class Pupil {
    var name: String
    var bio: String
    var goals: [Goals]
    var tags: [Tags]
    var mentors: [Mentor]
    var profileImage: UIImage
    var requestPending: [Request]
    
    init(name: String, bio: String, goals: [Goals], tags: [Tags], mentors: [Mentor], profileImage: UIImage, requestPending: [Request]) {
        self.name = name
        self.bio = bio
        self.goals = goals
        self.tags = tags
        self.mentors = mentors
        self.profileImage = profileImage
        self.requestPending = requestPending
    }
    
}
