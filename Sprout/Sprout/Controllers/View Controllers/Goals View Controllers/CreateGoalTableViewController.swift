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
    
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var completeByLabel: UILabel!
    @IBOutlet weak var completeBorder: UIView!
    @IBOutlet weak var completeStackView: UIStackView!
    @IBOutlet weak var selectDateTextField: UITextField!
    
    @IBOutlet var createGoalDatePicker: UIDatePicker!
    
    //MARK: - Properties
    var isDaily = true
    var isPrivate = false
    var willNotify = true
    var goalReceiver: Goal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        selectDateTextField.resignFirstResponder()
        if goalReceiver != nil {
            pageIDLabel.text = "Edit Goal"
        }
    }
    
    
    func setupViews() {
        pageIDLabel.font = UIFont(name: "Avenir", size: 40)
        descriptionBorder.layer.cornerRadius = descriptionBorder.frame.height/12
        descriptionBorder.layer.borderWidth = 1
        titleBorder.layer.cornerRadius = titleBorder.frame.height/12
        titleBorder.layer.borderWidth = 1
        completeBorder.layer.cornerRadius = completeBorder.frame.height/12
        completeBorder.layer.borderWidth = 1
        goalTypeLabel.font = UIFont(name: "Avenir", size: 20)
        completeByLabel.font = UIFont(name: "Avenir", size: 20)
        privacyLabel.font = UIFont(name: "Avenir", size: 20)
        saveButton.setTitle("Save", for: .normal)
        saveButton.layer.cornerRadius = saveButton.frame.height/2
        saveButton.titleLabel?.textColor = .white
        saveButton.backgroundColor = .middleGreen
        saveButton.titleLabel?.textColor = .white
        privacySegmentedController.backgroundColor = .middleGreen
        goalTypeSegmentedController.backgroundColor = .middleGreen
        privacySegmentedController.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
        privacySegmentedController.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.softBlack], for: UIControl.State.selected)
        goalTypeSegmentedController.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
        goalTypeSegmentedController.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.softBlack], for: UIControl.State.selected)
        
        completeStackView.isHidden = true
        
        selectDateTextField.inputView = createGoalDatePicker
    }
    
    
    
    //MARK: - Actions
    @IBAction func goalTypeToggled(_ sender: Any) {
        
        isDaily = !isDaily
        if isDaily == false {
            completeStackView.isHidden = false
        } else {
            if isDaily == true {
                completeStackView.isHidden = true
            }
        }
    }
    
    @IBAction func privacyToggled(_ sender: Any) {
        isPrivate = !isPrivate
    }
    
    @IBAction func notifySwitchToggled(_ sender: Any) {
        willNotify = !willNotify
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleLabel.text, !title.isEmpty,
            let body = descriptionTextView.text, !body.isEmpty,
            let userID = UserController.shared.currentUser?.uuid,
            let uuid = GoalController.shared.newGoal?.uuid
            
            else {return}
        let date: Date?
        if isDaily {
            date = nil
        } else {
            date = createGoalDatePicker.date
        }
        
        if let goal = goalReceiver {
            GoalController.shared.updateGoal(goal: goal, title: title, date: date, body: body) { (success) in
                if success {
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            }
        } else {
            GoalController.shared.createGoal(title: title, body: body, userID: userID, isComplete: false, isPrivate: isPrivate, isDaily: isDaily, date: date, uuid: uuid) { (success) in
                if success {
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            }
        }
    }
    
} // END OF CLASS
