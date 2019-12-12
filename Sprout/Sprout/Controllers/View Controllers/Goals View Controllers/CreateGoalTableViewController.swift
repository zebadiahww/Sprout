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
    
    //MARK: - Properties
    var isDaily = true
    var isPrivate = false
    var willNotify = true
    var goalReceiver: Goal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if goalReceiver != nil {
            pageIDLabel.text = "Edit Goal"
        }
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
        isDaily = !isDaily
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
