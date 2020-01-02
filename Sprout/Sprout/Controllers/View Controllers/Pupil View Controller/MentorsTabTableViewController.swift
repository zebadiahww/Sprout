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
    @IBOutlet weak var myMentorsCV: UICollectionView!
    @IBOutlet weak var myMentorsLabel: UILabel!
    @IBOutlet weak var entrepreneurshipLabel: UILabel!
    @IBOutlet weak var techLabel: UILabel!
    @IBOutlet weak var financeLabel: UILabel!
    @IBOutlet weak var searchBorder: UIView!
    @IBOutlet weak var noMentorsLabel: UILabel!
    @IBOutlet weak var entNoResultsLabel: UILabel!
    @IBOutlet weak var techNoResultsLabel: UILabel!
    @IBOutlet weak var financeNoResultsLabel: UILabel!
    
    
    
    
    //MARK: - Properties
    var myMentorsArray: [User] = []
    var techArray: [User] = []
    var entArray: [User] = []
    var financeArray: [User] = []
    var selectedMentor: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCells()
        setupViews()
        mentorSearchBar.delegate = self
        
    }
    
    //MARK: - Class Methods
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        performSegue(withIdentifier: "toMentorSearchVC", sender: self)
    }
    
    func setupViews() {
        pageIDLabel.font = UIFont(name: "Avenir", size: 30)
        myMentorsLabel.font = UIFont(name: "Avenir", size: 20)
        entrepreneurshipLabel.font = UIFont(name: "Avenir", size: 20)
        techLabel.font = UIFont(name: "Avenir", size: 20)
        financeLabel.font = UIFont(name: "Avenir", size: 20)
        
        noMentorsLabel.isHidden = false
        entNoResultsLabel.isHidden = false
        techNoResultsLabel.isHidden = false
        financeNoResultsLabel.isHidden = false
        
        searchBorder.layer.cornerRadius = searchBorder.frame.height/2
        searchBorder.layer.borderWidth = 1
        
        mentorSearchBar.searchTextField.borderStyle = .none
        mentorSearchBar.backgroundColor = .clear
        mentorSearchBar.searchTextField.layer.cornerRadius = mentorSearchBar.searchTextField.frame.height/2

        let glassIcon = self.mentorSearchBar.searchTextField.leftView as? UIImageView
        glassIcon?.image = glassIcon?.image?.withRenderingMode(.alwaysTemplate)
        glassIcon?.tintColor = .softBlack
        if let textfield = mentorSearchBar.value(forKey: "searchField") as? UITextField {
            textfield.backgroundColor = .white
        }
    }
    
    func setupCells() {
        
        UserController.shared.fetchMentorsbyCategoryWith(searchTerm: "Finance") { (financeMentors) in
            self.financeArray = financeMentors
            if self.financeArray.isEmpty {
                self.financeNoResultsLabel.isHidden = false
            } else {
                self.financeNoResultsLabel.isHidden = true
            }
        }
        UserController.shared.fetchMentorsbyCategoryWith(searchTerm: "Technology") { (techMentors) in
            self.techArray = techMentors
            if self.techArray.isEmpty {
                self.techNoResultsLabel.isHidden = false
            } else {
                self.techNoResultsLabel.isHidden = true
            }
        }
        UserController.shared.fetchMentorsbyCategoryWith(searchTerm: "Entrepreneurship") { (entMentors) in
            self.entArray = entMentors
            if self.entArray.isEmpty {
                self.entNoResultsLabel.isHidden = false
            } else {
                self.entNoResultsLabel.isHidden = true
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProfileView" {
            //TODO: - finish preparing for segue
        }
    }
    
} // END OF CLASS


extension MentorsTabTableViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case entrepreneurshipCV :
            return entArray.count
        case techCV :
            return techArray.count
        case financeCV :
            return financeArray.count
        case myMentorsCV:
            return myMentorsArray.count
        default :
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(0.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mentorCell", for: indexPath) as? MentorCollectionViewCell else { return UICollectionViewCell() }
        
        switch collectionView {
        case entrepreneurshipCV:
            let mentor = entArray[indexPath.item]
            cell.updateViews()
            cell.user = mentor
        case techCV:
            let mentor = techArray[indexPath.item]
            cell.updateViews()
            cell.user = mentor
        case financeCV:
            let mentor = financeArray[indexPath.item]
            cell.updateViews()
            cell.user = mentor
        case myMentorsCV:
            let mentor = myMentorsArray[indexPath.item]
            cell.updateViews()
            cell.user = mentor
        default:
            return cell
        }
        return cell
    }
}

extension MentorsTabTableViewController: viewProfileButtonDelegate {
    func segueToProfile(mentor: User) {
        self.selectedMentor = mentor
        performSegue(withIdentifier: "toProfileView", sender: self)
    }
}
