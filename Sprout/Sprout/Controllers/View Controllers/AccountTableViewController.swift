//
//  AccountTableViewController.swift
//  Sprout
//
//  Created by Marcus Armstrong on 12/9/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class AccountTableViewController: UITableViewController, UITextViewDelegate, PhotoSelectorViewControllerDelegate {
    
    
    
    // MARK: - Properties

    @IBOutlet weak var photoSelectorView: UIView!
    @IBOutlet weak var editPhotoButton: UIButton!
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
    
    var selectedImage: UIImage?

    // MARK: - LifeCycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialViewSetup()
    }
    
    // MARK: - Actions

    
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
        saveButton.layer.cornerRadius = saveButton.frame.height/2
    }
    
    func setViewForProfileDefault() {
    }
    
    func setViewForProfileEdit() {
    }
    
    func photoSelectorViewControllerSelected(image: UIImage) {
        selectedImage = image
    }
    
}
