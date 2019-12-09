//
//  AccountTableViewController.swift
//  Sprout
//
//  Created by Marcus Armstrong on 12/9/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class AccountTableViewController: UITableViewController, UITextViewDelegate {
    
    // MARK: - Properties
    
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var photoSelectorView: UIView!
    @IBOutlet weak var editPhotoButton: UIButton!
    @IBOutlet weak var accountTypeLabel: UILabel!
    @IBOutlet weak var generalNameLabel: UILabel!
    @IBOutlet weak var personalDetailFieldsStackView: UIStackView!
    @IBOutlet weak var nameFieldLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailFieldLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var currentPasswordFieldLabel: UILabel!
    @IBOutlet weak var currentPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordFieldLabel: UILabel!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordFieldLabel: UILabel!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var bioFieldLabel: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var InterestsExpertiseLabel: UILabel!
    @IBOutlet weak var pickACategoryLabel: UILabel!
    @IBOutlet weak var categoryBorder: UIView!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet var categoryPickerView: UIPickerView!
    @IBOutlet weak var tagBorder: UIView!
    @IBOutlet weak var tagSearchBar: UISearchBar!
    @IBOutlet weak var addTagButton: UIButton!
    @IBOutlet weak var tagCollectionView: UICollectionView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var infoCell: UITableViewCell!
    @IBOutlet weak var myGoalsLabel: UILabel!
    @IBOutlet weak var goalsCollectionView: UICollectionView!
    @IBOutlet weak var seeAllGoalsButton: UIButton!
    @IBOutlet weak var myMentorsLabel: UILabel!
    @IBOutlet weak var mentorPupilCollectionView: UICollectionView!

    // MARK: - LifeCycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialViewSetup()
    }
    
    // MARK: - Actions
    
    @IBAction func editProfileButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func editPhotoButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func addTagButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
    }
    
    
    // MARK: - View Setup Functions
    func initialViewSetup() {
        guard let currentUser = UserController.shared.currentUser else {return}
        photoSelectorView.layer.cornerRadius = photoSelectorView.frame.height/2
        accountTypeLabel.text = currentUser.isMentor ? "Mentor" : "Pupil"
        accountTypeLabel.layer.borderWidth = 1
        accountTypeLabel.layer.borderColor = UIColor.black.cgColor
        generalNameLabel.textAlignment = .left
        generalNameLabel.text = UserController.shared.currentUser?.name
        bioTextView.layer.borderWidth = 1
        bioTextView.layer.cornerRadius = bioTextView.frame.height/12
        InterestsExpertiseLabel.text = currentUser.isMentor ? "Expertise" : "Interests"
        categoryBorder.layer.cornerRadius = categoryBorder.frame.height/12
        categoryBorder.layer.borderWidth = 1
        categoryBorder.layer.borderColor = UIColor.black.cgColor
        tagBorder.layer.borderWidth = 1
        tagBorder.layer.borderColor = UIColor.black.cgColor
        seeAllGoalsButton.layer.cornerRadius = seeAllGoalsButton.frame.height/2
        saveButton.layer.cornerRadius = saveButton.frame.height/2
    }
    
    func setViewForProfileDefault() {
        UIView.animate(withDuration: 1, animations: {
            self.editProfileButton.isHidden = false
            self.photoSelectorView.frame.size = CGSize(width: self.view.frame.width * 0.4, height: self.view.frame.width * 0.4)
            self.accountTypeLabel.isHidden = false
            self.generalNameLabel.textAlignment = .left
            self.generalNameLabel.text = UserController.shared.currentUser?.name
            self.personalDetailFieldsStackView.isHidden = true
            self.bioFieldLabel.isHidden = true
            self.bioTextView.layer.borderColor = UIColor.clear.cgColor
            self.InterestsExpertiseLabel.isHidden = true
            self.pickACategoryLabel.isHidden = true
            self.categoryBorder.isHidden = true
            self.tagBorder.isHidden = true
            self.tagCollectionView.isHidden = true
            self.addTagButton.isHidden = true
            self.saveButton.isHidden = true
            self.infoCell.isHidden = false
            
        }) { (success) in
            if success {
                print("Successfully animated to default profile view")
            }
        }
    }
    
    func setViewForProfileEdit() {
        UIView.animate(withDuration: 1, animations: {
            self.editProfileButton.isHidden = true
            self.photoSelectorView.frame.size = CGSize(width: self.view.frame.width * 0.4, height: self.view.frame.width * 0.4)
            self.accountTypeLabel.isHidden = true
            self.generalNameLabel.textAlignment = .center
            self.generalNameLabel.text = "General"
            self.personalDetailFieldsStackView.isHidden = false
            self.bioFieldLabel.isHidden = false
            self.bioTextView.layer.borderColor = UIColor.black.cgColor
            self.InterestsExpertiseLabel.isHidden = false
            self.pickACategoryLabel.isHidden = false
            self.categoryBorder.isHidden = false
            self.tagBorder.isHidden = false
            self.tagCollectionView.isHidden = false
            self.addTagButton.isHidden = false
            self.saveButton.isHidden = false
            self.infoCell.isHidden = true
            
        }) { (success) in
            if success {
                print("Successfully animated to edit profile view")
            }
        }
    }
}
