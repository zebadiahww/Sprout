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
import FirebaseAuth

class CreateProfileTableViewController: UITableViewController, PhotoSelectorViewControllerDelegate {
    
    //MARK: Properties
    var currentUser: User?
    var isMentor: Bool?
    var tags: Tag?
    var selectedCategory: String?
    
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
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        setupPicker()
        createToolBar()
        
        TagsController.shared.tags = [
            Tag(title: "test", category: "testing"),
            Tag(title: "test1", category: "testing"),
            Tag(title: "test123456789", category: "testing"),
            Tag(title: "test34567892", category: "testing"),
            Tag(title: "test2", category: "testing"),
            Tag(title: "teertyst2", category: "testing"),
            Tag(title: "test", category: "testing"),
            Tag(title: "test1", category: "testing"),
            Tag(title: "test123456789", category: "testing"),
            Tag(title: "test34567892", category: "testing"),
            Tag(title: "test2", category: "testing"),
            Tag(title: "teertyst2", category: "testing")
        ]
    }
    
    
    
    
    //MARK: - Actions
    @IBAction func addTagButtonTapped(_ sender: UIButton) {
        guard let newTag = tagTextField.text, !newTag.isEmpty,
            let category = categoryTextField.text, !category.isEmpty,
            let userIDs = currentUser?.uuid
            else { return }
        
        TagsController.shared.searchAndFetchTag(with: newTag) { (success) in
            if success {
                self.tags?.userIDs?.append(userIDs)
            } else {
                TagsController.shared.createTag(with: newTag, category: category, userID: userIDs) { (success) in
                    DispatchQueue.main.async {
                        self.tagCollectionView.reloadData()
                        print("successfully created new tag")
                    }
                }
            }
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        let linkedIn = linkedInTextField.text
        let website = websiteTextField.text
        guard let uuid = Auth.auth().currentUser?.uid,
            let name = nameTextField.text, !name.isEmpty,
            let bio = bioTextView.text, !bio.isEmpty,
            let occupation = OccupationTextField.text, !occupation.isEmpty,
            let isMentor = isMentor
            else { return }
        
        UserController.shared.createUser(uuid: uuid , name: name, bio: bio, occupation: occupation, isMentor: isMentor, profileImage: selectedImage, website: website, linkedInURL: linkedIn) { (success) in
            DispatchQueue.main.async {
                print("User created successfully")
            }
        }
    }
    
    func setupPicker() {
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        categoryTextField.inputView = categoryPicker
        categoryPicker.backgroundColor = .white
    }
    
    func photoSelectorViewControllerSelected(image: UIImage) {
        selectedImage = image
    }
    
    func createToolBar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.tintColor = .darkGreen
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(CreateProfileTableViewController.dismissKeyboard))
        
        
        toolBar.setItems([spacer,
                          doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        categoryTextField.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "photoSelectionSegue" {
            let destinationVC = segue.destination as? PhotoSelectorViewController
            destinationVC?.delegate = self
        }
    }
} // End Of Class

extension CreateProfileTableViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //
        return TagsController.shared.tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagCell", for: indexPath) as? SkillsTagCollectionViewCell else { return UICollectionViewCell() }
        
        let tag = TagsController.shared.tags[indexPath.item]
        cell.skillTagLabel.text = tag.title
        cell.backgroundColor = .middleGreen
        cell.layer.cornerRadius = 4
        return cell
    }
}

extension CreateProfileTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Categories.categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Categories.categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         selectedCategory = Categories.categories[row]
         categoryTextField.text = selectedCategory
    }
}


