//
//  MentorCollectionViewCell.swift
//  Sprout
//
//  Created by Zebadiah Watson on 12/9/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class MentorCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var viewProfileButton: UIButton!
    
    
    //MARK: - Properties
    
    
    func updateViews() {
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        
        viewProfileButton.layer.cornerRadius = viewProfileButton.frame.height/2
        viewProfileButton.backgroundColor = .middleGreen
        viewProfileButton.titleLabel?.textColor = .white
        
    }
    
    
    
    //MARK: - Actions
    @IBAction func viewProfileButtonTapped(_ sender: Any) {
       // perform segue
    }
    
}
