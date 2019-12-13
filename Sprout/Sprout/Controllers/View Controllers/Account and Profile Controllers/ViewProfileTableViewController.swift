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
    
    @IBOutlet weak var tagTypeLabel: UILabel!
    @IBOutlet weak var tagsCollectionView: UICollectionView!
    @IBOutlet weak var myGoalsLabel: UILabel!
    @IBOutlet weak var seeAllGoalsButton: UIButton!
    @IBOutlet weak var goalsCollectionView: UICollectionView!
    @IBOutlet weak var myMentorsLabel: UILabel!
    @IBOutlet weak var mentorsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews() {
        guard let currentUser = UserController.shared.currentUser else {return}
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        if currentUser.profilePicture == nil {
            profileImageView.image = UIImage(named: "person")
        } else {
            profileImageView.image = currentUser.profilePicture
        }
        accountTypeLabel.text = currentUser.isMentor ? "Mentor" : "Pupil"
        nameLabel.text = currentUser.name
        bioTextView.text = currentUser.bio
        tagsCollectionView.dataSource = self
        TagsController.shared.fetchTag { (success) in
            DispatchQueue.main.async {
                self.tagsCollectionView.reloadData()
            }
        }
        
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

extension ViewProfileTableViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let currentUserTags = UserController.shared.currentUser?.tags else {return 0}
        if collectionView == tagsCollectionView {
            return currentUserTags.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tagsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagCell", for: indexPath) as? ForeignTagCollectionViewCell else {return UICollectionViewCell()}
            guard let currentUserTags = UserController.shared.currentUser?.tags else {return UICollectionViewCell()}
            let tag = currentUserTags[indexPath.row]
            cell.updateLabel(title: tag.title)
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
