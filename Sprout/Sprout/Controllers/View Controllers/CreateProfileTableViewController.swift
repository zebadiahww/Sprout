//
//  CreateProfileTableViewController.swift
//  Sprout
//
//  Created by Marcus Armstrong on 12/2/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//


/**
 1. search and fetch
 a. if true append user.userID to the tags array of userIDs
 - update the tag
 b. if false, tag doesnt exist so call createTag()
 
 */
import UIKit

class CreateProfileTableViewController: UITableViewController, PhotoSelectorViewControllerDelegate {
    
    //MARK: Properties
    var currentUser: User?
    var email: String?
    var isMentor: Bool?
    
    //MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var OccupationTextField: UITextField!
    @IBOutlet weak var InterestExpertiseLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet var categoryPicker: UIPickerView!
    @IBOutlet weak var tagTextField: UITextField!
    @IBOutlet weak var addTagButton: UIButton!
    @IBOutlet weak var tagCollectionView: UICollectionView!
    @IBOutlet weak var linkedInTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    //MARK: - Actions
    @IBAction func addTagButtonTapped(_ sender: UIButton) {
        guard let newTag = tagTextField.text, !newTag.isEmpty,
            let category = categoryTextField.text, !category.isEmpty,
            let userID = currentUser?.uid
            else { return }
        
        TagsController.shared.createTag(with: newTag, category: category, userID: userID) { (success) in
            DispatchQueue.main.async {
                self.tagCollectionView.reloadData()
                print("successfully created new tag")
            }
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        let linkedIn = linkedInTextField.text
        let website = websiteTextField.text
        guard let uid = currentUser?.uid,
            let name = nameTextField.text, !name.isEmpty,
            let bio = bioTextView.text, !bio.isEmpty,
            let email = email,
            let isMentor = isMentor
            else { return }
        
        UserController.shared.createUser(uid: uid , name: name, bio: bio, email: email, isMentor: isMentor, profileImage: selectedImage, website: website, linkedInURL: linkedIn) { (success) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
                print("User created successfully")
            }
        }
    }
    
    func photoSelectorViewControllerSelected(image: UIImage) {
        selectedImage = image
    }
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "photoSelectionSegue" {
            let destinationVC = segue.destination as? PhotoSelectorViewController
            destinationVC?.delegate = self
        }
    }
}

extension CreateProfileTableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //
        return TagsController.shared.tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //
        return UICollectionViewCell()
    }
    
    
}
