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
    
    @IBOutlet weak var goalStyleLabel: UILabel!
    @IBOutlet weak var iconButton: UIButton!
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    
    @IBOutlet weak var privacyLabel: UILabel!
    @IBOutlet weak var privacySegmentedController: UISegmentedControl!
    
    @IBOutlet weak var notifyLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var notifySwitch: UISwitch!
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    //MARK: - Actions
    @IBAction func goalTypeToggled(_ sender: Any) {
    }
    @IBAction func iconButtonTaped(_ sender: Any) {
    }
    @IBAction func colorButtonTapped(_ sender: Any) {
    }
    @IBAction func privacyToggled(_ sender: Any) {
    }
    @IBAction func notifySwitchToggled(_ sender: Any) {
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
