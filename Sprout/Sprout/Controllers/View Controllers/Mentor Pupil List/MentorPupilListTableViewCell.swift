//
//  MentorPupilListTableViewCell.swift
//  Sprout
//
//  Created by Travis Wheeler on 12/10/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit
protocol GoalButtonCellDelegate: class {
    func toGoalPage(_ sender: MentorPupilListTableViewCell)
}

class MentorPupilListTableViewCell: UITableViewCell {

    weak var delegate: GoalButtonCellDelegate?
    
    //MARK: - Outlets
    @IBOutlet weak var pupilImage: UIImageView!
    @IBOutlet weak var pupilNameLabel: UILabel!
    @IBOutlet weak var goalProgressLabel: UILabel!
    @IBOutlet weak var goalsCompletedLabel: UILabel!
    @IBOutlet weak var suggestGoalButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func suggestGoalButtonTapped(_ sender: Any) {
        delegate?.toGoalPage(self)
    }
    
    func fetchPupilData() {
        // need pupil image, name, tag/category they are associated with, how many goals they have and how many they have completed.
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func viewDidLoad() {
        self.pupilImage.layer.cornerRadius = pupilImage.frame.height/2
        self.suggestGoalButton.layer.cornerRadius = suggestGoalButton.frame.height/2
    }
}
