//
//  FindMentorViewController.swift
//  Sprout
//
//  Created by Zebadiah Watson on 12/10/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class FindMentorViewController: UIViewController, UISearchBarDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var pageIDLabel: UILabel!
    @IBOutlet weak var mentorSearchBar: UISearchBar!
    @IBOutlet weak var searchBorder: UIView!
    
    
    //MARK: - Properties

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    //MARK: - Actions
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }

} // END OF CLASS

extension FindMentorViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return UserController.shared.searchedUsers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mentorCell", for: indexPath) as? MentorCollectionViewCell else { return UICollectionViewCell() }
        
               
        let user = UserController.shared.searchedUsers[indexPath.item]
        cell.nameLabel.text = user.name
        cell.occupationLabel.text = user.occupation
        cell.profileImage.image = nil //fix this
              
        return cell
    }
}
