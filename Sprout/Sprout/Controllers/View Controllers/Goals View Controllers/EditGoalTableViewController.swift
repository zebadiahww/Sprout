//
//  EditGoalTableViewController.swift
//  Sprout
//
//  Created by Zebadiah Watson on 12/9/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class EditGoalTableViewController: UITableViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var pageIDLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet var editGoalDatePicker: UIDatePicker!

    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func setupViews() {
        pageIDLabel.font = UIFont(name: "Avenir", size: 14)
        saveButton.setTitle("Save", for: .normal)
        saveButton.layer.cornerRadius = saveButton.frame.height/2
        saveButton.backgroundColor = .middleGreen
        saveButton.titleLabel?.textColor = .white
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // do some stuff here for picker
    }

    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
     //delegate functionality to the Cell
        navigationController?.popViewController(animated: true)
    }
    
    

}
