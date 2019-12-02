//
//  SettingsViewController.swift
//  Sprout
//
//  Created by Zebadiah Watson on 11/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    //MARK: - Outlets
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var termsAndConditionsLabel: UILabel!
    
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var termsAndConditionsButton: UIButton!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    //MARK: - Actions
    @IBAction func profileButtonTapped(_ sender: Any) {
    }
    @IBAction func termsAndConditionsButtonTapped(_ sender: Any) {
    }
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
}
