//
//  MentorRequestTableViewCell.swift
//  Sprout
//
//  Created by Travis Wheeler on 12/10/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit
protocol AcceptButtonDelegate: class {
    func toHomePage(_ sender: MentorRequestTableViewCell)
}
protocol DeclineButtonDelegate: class  {
    func toHomePage(_ sender: MentorRequestTableViewCell)
}

class MentorRequestTableViewCell: UITableViewCell {
    
    weak var acceptDelegate: AcceptButtonDelegate?
    weak var declineDelegate: DeclineButtonDelegate?

    //MARK: - Outlets
    @IBOutlet weak var pupilImage: UIImageView!
    @IBOutlet weak var pupilNameLabel: UILabel!
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
