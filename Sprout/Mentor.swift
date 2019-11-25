//
//  Mentor.swift
//  Sprout
//
//  Created by Travis Wheeler on 11/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class Mentor {
    var name: String
    var bio: String
    var isMentor: Bool
    var profileImage: UIImage
    var pupil: [Pupil]
    var tags: [Tags]
    var request: Request
    
    init(name: String, bio: String, isMentor: Bool, profileImage: UIImage, pupil: [Pupil], tags: [Tags], request: Request) {
    self.name = name
    self.bio = bio
    self.isMentor = isMentor
    self.profileImage = profileImage
    self.pupil = pupil
    self.tags = tags
    self.request = request
    }
}
