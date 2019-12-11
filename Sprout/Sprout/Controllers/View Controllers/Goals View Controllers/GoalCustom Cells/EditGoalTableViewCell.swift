//
//  EditGoalTableViewCell.swift
//  Sprout
//
//  Created by Zebadiah Watson on 12/9/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class EditGoalTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var descriptionBorder: UIView!
    
    @IBOutlet weak var privacySegmentedController: UISegmentedControl!
    @IBOutlet weak var trashButton: UIButton!
    @IBOutlet weak var calenderButton: UIButton!
    
    
    //MARK: - Properties
    
    
    

    
    
    //MARK: - Actions
    @IBOutlet weak var privacyToggled: UISegmentedControl!
    @IBOutlet weak var trashButtonTapped: UIButton!
    @IBOutlet weak var calnderButtonTapped: UIButton!
    
}
