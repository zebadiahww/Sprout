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
        mentorSearchBar.becomeFirstResponder()
        setupViews()
        mentorSearchBar.delegate = self
        findMentorCollectionView.delegate = self
        findMentorCollectionView.dataSource = self
    }
    
    func setupViews() {
        pageIDLabel.font = UIFont(name: "Avenir", size: 30)
        
        mentorSearchBar.searchTextField.borderStyle = .none
        mentorSearchBar.backgroundColor = .clear
        let glassIcon = self.mentorSearchBar.searchTextField.leftView as? UIImageView
        glassIcon?.image = glassIcon?.image?.withRenderingMode(.alwaysTemplate)
        glassIcon?.tintColor = .softBlack
        mentorSearchBar.searchTextField.layer.cornerRadius = mentorSearchBar.searchTextField.frame.height/2
        searchBorder.layer.cornerRadius = searchBorder.frame.height/2
        searchBorder.layer.borderWidth = 1
        if let textfield = mentorSearchBar.value(forKey: "searchField") as? UITextField {
            textfield.backgroundColor = .white
            
        }
    }
    
    //MARK: - Actions
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.resignFirstResponder()
        guard let searchTerm = mentorSearchBar.text, !searchTerm.isEmpty else {return}
        var mentors: [User] = []
        UserController.shared.fetchMentorsByTagTitleWith(searchTerm: searchTerm) { (users) in
            mentors = users
            UserController.shared.fetchMentorsbyCategoryWith(searchTerm: searchTerm) { (users) in
                for user in users {
                    mentors.append(user)
                }
                UserController.shared.fetchMentorsByNameWith(searchTerm: searchTerm) { (users) in
                    for user in users {
                        mentors.append(user)
                    }
                    let finalMentors = Set(mentors)
                    UserController.shared.searchedUsers = Array(finalMentors)
                    DispatchQueue.main.async {
                        print(UserController.shared.searchedUsers.count)
                        if UserController.shared.searchedUsers.count == 0 {
                            let alert = UIAlertController(title: "User Not Found", message: nil, preferredStyle: .alert)

                            let dismissAction = UIAlertAction(title: "Dismiss", style: .default)
                            alert.addAction(dismissAction)
                            self.present(alert, animated: true)
                        }
                        self.findMentorCollectionView.reloadData()
                    }
                }
            }
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
} // END OF CLASS

extension FindMentorViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return UserController.shared.searchedUsers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mentorCell", for: indexPath) as? MentorCollectionViewCell else { return UICollectionViewCell() }
        let user = UserController.shared.searchedUsers[indexPath.item]
        cell.delegate = self
        cell.user = user 
        return cell
    }
}

extension FindMentorViewController: viewProfileButtonDelegate {
    func segueToProfile(mentor: User) {
        
    }
}
