//
//  PupilProfileViewController.swift
//  Sprout
//
//  Created by Zebadiah Watson on 11/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class PupilProfileViewController: UIViewController {
    
    
    //MARK: - Outlets
    @IBOutlet weak var profilePictureImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var goalsLabel: UILabel!
    @IBOutlet weak var mentorsLabel: UILabel!
    
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var seeAllGoalsButton: UIButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    //MARK: - Actions
    @IBAction func editProfileButtonTapped(_ sender: Any) {
    }
    @IBAction func seeAllGoalsButtonTapped(_ sender: Any) {
    }
    
    
    
    
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
