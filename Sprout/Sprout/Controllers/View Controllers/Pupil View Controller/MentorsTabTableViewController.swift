//
//  MentorsTabTableViewController.swift
//  Sprout
//
//  Created by Zebadiah Watson on 12/9/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class MentorsTabTableViewController: UITableViewController, UISearchBarDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var mentorSearchBar: UISearchBar!
    @IBOutlet weak var entrepreneurshipCV: UICollectionView!
    @IBOutlet weak var techCV: UICollectionView!
    @IBOutlet weak var financeCV: UICollectionView!
    @IBOutlet weak var pageIDLabel: UILabel!
    
    
    
    
    //MARK: - Properties

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    //MARK: - Class Methods
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        performSegue(withIdentifier: "toMentorSearchVC", sender: self)
    }
    
    func setupViews() {
        self.pageIDLabel.font = UIFont(name: "Avenir", size: 14)

    }

} // END OF CLASS


extension MentorsTabTableViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        if collectionView == entrepreneurshipCV {
//            UserController.shared.searchedUsers.count
//        } else if collectionView == techCV {
//
//        } else if collectionView == financeCV {
//
//        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mentorCell", for: indexPath) as? SkillsTagCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    
}
