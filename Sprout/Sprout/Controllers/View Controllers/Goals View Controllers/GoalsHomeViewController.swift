//
//  GoalsHomeViewController.swift
//  Sprout
//
//  Created by Zebadiah Watson on 11/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class GoalsHomeViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var addGoalButton: UIButton!
    @IBOutlet weak var editGoalButton: UIButton!
    
    @IBOutlet weak var goalsLabel: UILabel!
    @IBOutlet weak var dailyLongTermLabel: UILabel!
    @IBOutlet weak var progressRingView: UIView!
    
    
    
    
    //MARK: - Properties

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    //MARK: - Actions
    @IBAction func addGoalButtonTapped(_ sender: Any) {
    }
    
    @IBAction func editGoalButtonTapped(_ sender: Any) {
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
