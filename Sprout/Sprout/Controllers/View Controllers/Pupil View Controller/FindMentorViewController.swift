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
    @IBOutlet weak var findMentorCollectionView: UICollectionView!
    
    
    //MARK: - Properties

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    
    //MARK: - Actions
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = mentorSearchBar.text, mentorSearchBar.text!.isEmpty else {return}
        UserController.shared.fetchMentorsBySearchTerm(searchTerm: searchTerm) { (success) in
            
            if success {
                let dispatchGroup = DispatchGroup()
                for mentor in UserController.shared.searchedUsers {
                    dispatchGroup.enter()
                    UserController.shared.fetchProfilePhoto(user: mentor) { (success) in
                        dispatchGroup.leave()
                        if success {
                            print("successfully grabbed mentor photo")
                        }
                    }
                }
                
                dispatchGroup.notify(queue: .main) {
                    self.findMentorCollectionView.reloadData()
                }
            }
            
            let alert = UIAlertController(title: "User Not Found", message: nil, preferredStyle: .alert)
            
            let dismissAction = UIAlertAction(title: "Dismiss", style: .default)
            alert.addAction(dismissAction)
            self.present(alert, animated: true)
        }
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
        cell.profileImage.image = user.profilePicture
              
        return cell
    }
}
