//
//  PupilCollectionViewCell.swift
//  Sprout
//
//  Created by Marcus Armstrong on 12/12/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class PupilCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pupilProfilePhoto: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func updateViews(pupil:User) {
        pupilProfilePhoto.image = pupil.profilePicture
        nameLabel.text = pupil.name
    }
    
}
