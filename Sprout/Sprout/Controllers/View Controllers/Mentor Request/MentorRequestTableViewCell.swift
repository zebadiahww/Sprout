//
//  MentorRequestTableViewCell.swift
//  Sprout
//
//  Created by Travis Wheeler on 12/10/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class MentorRequestTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var pupilImage: UIImageView!
    @IBOutlet weak var pupilNameLabel: UILabel!
    @IBOutlet weak var pupilTagLabel: UILabel!
    @IBOutlet weak var declineButton: UIButton!
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var requestDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func viewDidLoad() {
        self.pupilImage.layer.cornerRadius = pupilImage.frame.height/2
    }
}
