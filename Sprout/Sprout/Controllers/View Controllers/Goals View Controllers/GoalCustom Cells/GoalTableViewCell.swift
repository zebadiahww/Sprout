//
//  GoalTableViewCell.swift
//  Sprout
//
//  Created by Zebadiah Watson on 12/5/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class GoalTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var goalTitleLabel: UILabel!
    @IBOutlet weak var isPublicLabel: UILabel!
        
    
    //MARK: - Properties
    
    
    //MARK: Class Methods
    func updateViews() {
        finishButton.layer.cornerRadius = finishButton.frame.height/2
        finishButton.backgroundColor = .middleGreen
        finishButton.titleLabel?.textColor = .white
    }
    
    
    //MARK: - Actions
    @IBAction func finishButtonTapped(_ sender: Any) {
        // updategoal
        
        finishButton.titleLabel?.text = "Completed"
        finishButton.backgroundColor = .lightGreen
    }
    

}
