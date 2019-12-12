//
//  MentorCollectionViewCell.swift
//  Sprout
//
//  Created by Zebadiah Watson on 12/9/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

protocol viewProfileButtonDelegate {
    func segueToProfile(mentor: User)
}

class MentorCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var viewProfileButton: UIButton!
    
    //MARK: - Properties
    
    var delegate: viewProfileButtonDelegate?
    var user: User?
    
    func updateViews(mentor: User) {
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        
        viewProfileButton.layer.cornerRadius = viewProfileButton.frame.height/2
        viewProfileButton.backgroundColor = .middleGreen
        viewProfileButton.titleLabel?.textColor = .white
        
        nameLabel.text = mentor.name
        occupationLabel.text = mentor.occupation
    }
    
    //MARK: - Actions
    @IBAction func viewProfileButtonTapped(_ sender: Any) {
        guard let user = user else {return}
        delegate?.segueToProfile(mentor: user)
    }
}
