//
//  SkillsTagCollectionViewCell.swift
//  Sprout
//
//  Created by Zebadiah Watson on 12/4/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class SkillsTagCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var skillTagLabel: UILabel!
    @IBOutlet weak var deleteTagButton: UIButton!
    
    //MARK: - Properties
    var tags: Tag? 
    
    
    
    
    
    
    
    
    //MARK: - Actions
    @IBAction func deleteTagButtonTapped(_ sender: Any) {
    }
    
}
