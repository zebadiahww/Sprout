//
//  ViewProfileTableViewController.swift
//  Sprout
//
//  Created by Marcus Armstrong on 12/10/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class ViewProfileTableViewController: UITableViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var accountTypeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var myGoalsLabel: UILabel!
    @IBOutlet weak var seeAllGoalsButton: UIButton!
    @IBOutlet weak var myMentorsLabel: UILabel!
    
    @IBOutlet weak var goalsCollectionView: UICollectionView!
    @IBOutlet weak var mentorsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditProfile" {
            guard let destinationVC = segue.destination as? AccountTableViewController else {return}
            
            if let image = profileImageView.image {
                destinationVC.selectedImage = image
            }
        }
    }
    

}
