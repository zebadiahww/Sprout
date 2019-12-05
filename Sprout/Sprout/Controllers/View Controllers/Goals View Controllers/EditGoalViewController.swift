//
//  EditGoalViewController.swift
//  Sprout
//
//  Created by Zebadiah Watson on 12/5/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class EditGoalViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var pageTitleLabel: UILabel!
    @IBOutlet weak var goalNameLabel: UILabel!
    @IBOutlet weak var goalTypeLabel: UILabel!
    @IBOutlet weak var styleLabel: UILabel!
    @IBOutlet weak var privacyLabel: UILabel!
    @IBOutlet weak var notifyMeLabel: UILabel!
    @IBOutlet weak var notificationDescriptionLabel: UILabel!
    
    @IBOutlet weak var goalNameTextField: UITextField!
    @IBOutlet weak var goalDescriptionTextView: UITextView!
    
    @IBOutlet weak var goalTypeController: UISegmentedControl!
    @IBOutlet weak var privacyController: UISegmentedControl!
    @IBOutlet weak var notificationSwitch: UISwitch!
    
    @IBOutlet weak var iconButton: UIButton!
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    
    
    
    //MARK: - Properties

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    //MARK: - Actions
    @IBAction func goalTypeControllerToggled(_ sender: Any) {
    }
    @IBAction func privacyControllerToggled(_ sender: Any) {
    }
    @IBAction func notificationSwitchToggled(_ sender: Any) {
    }
    
    
    @IBAction func iconButtonTapped(_ sender: Any) {
    }
    @IBAction func colorButtonTapped(_ sender: Any) {
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
    
    
    
    
    
    
    //MARK: - Methods
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
