//
//  CreateGoalTableViewController.swift
//  Sprout
//
//  Created by Zebadiah Watson on 12/9/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class CreateGoalTableViewController: UITableViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var pageIDLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleBorder: UIView!
    @IBOutlet weak var goalTitleTextField: UITextField!
    
    @IBOutlet weak var descriptionBorder: UIView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var goalTypeLabel: UILabel!
    @IBOutlet weak var goalTypeSegmentedController: UISegmentedControl!
    
    @IBOutlet weak var privacyLabel: UILabel!
    @IBOutlet weak var privacySegmentedController: UISegmentedControl!
    
    @IBOutlet weak var notifyLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var notifySwitch: UISwitch!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var completeByLabel: UILabel!
    @IBOutlet weak var completeBorder: UIView!
    @IBOutlet weak var completeStackView: UIStackView!
    
    @IBOutlet var createGoalDatePicker: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func setupViews() {
        saveButton.setTitle("Save", for: .normal)
        saveButton.layer.cornerRadius = saveButton.frame.height/2
        saveButton.backgroundColor = .middleGreen
        saveButton.titleLabel?.textColor = .white
        
        completeStackView.isHidden = true
    }
    
    
    
    //MARK: - Actions
    @IBAction func goalTypeToggled(_ sender: Any) {
    }
    
    @IBAction func privacyToggled(_ sender: Any) {
    }
    @IBAction func notifySwitchToggled(_ sender: Any) {
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        //set fields
        navigationController?.popViewController(animated: true)
    }
    
} // END OF CLASS
