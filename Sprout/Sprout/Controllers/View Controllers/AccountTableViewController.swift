//
//  AccountTableViewController.swift
//  Sprout
//
//  Created by Marcus Armstrong on 12/9/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class AccountTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var photoSelectorView: UIView!
    @IBOutlet weak var editPhotoButton: UIButton!
    @IBOutlet weak var accountTypeLogo: UILabel!
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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
    
}
