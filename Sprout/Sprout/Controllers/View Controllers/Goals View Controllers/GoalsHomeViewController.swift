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
    @IBOutlet weak var dailyGoalsButton: UIButton!
    @IBOutlet weak var longTermGoalsButton: UIButton!
    
    @IBOutlet weak var pageIDLabel: UILabel!
    @IBOutlet weak var goalTypeLabel: UILabel!
    @IBOutlet weak var progressRingView: UIView!
    
    @IBOutlet weak var goalsTableView: UITableView!
    
    
    
    //MARK: - Properties
    var longTermGoals: [Goal] = []
    var isDailySelected = true
    var dailyGoals: [Goal] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        GoalController.shared.fetchGoal { (success) in
            if success {
                self.longTermGoals = GoalController.shared.goals.filter({ $0.isDaily == false })
                self.dailyGoals = GoalController.shared.goals.filter({  $0.isDaily == true })
                self.goalsTableView.reloadData()
            }
        }
        

        // Do any additional setup after loading the view.
    }
    
    
    
    //MARK: - Class Methods
    func setupViews() {
        pageIDLabel.font = UIFont(name: "Avenir", size: 14)
        pageIDLabel.text = "Goals"
        
        goalTypeLabel.font = UIFont(name: "Avenir", size: 11)
        goalTypeLabel.text = "Daily Goals"


        dailyGoalsButton.layer.cornerRadius = dailyGoalsButton.frame.height/2
        dailyGoalsButton.backgroundColor = .middleGreen
        
        longTermGoalsButton.layer.cornerRadius = longTermGoalsButton.frame.height/2
        longTermGoalsButton.backgroundColor = .lightGreen
    }
    
    
    
    //MARK: - Actions
    @IBAction func addGoalButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toCreateGoalVC", sender: self)
    }
    
    @IBAction func editGoalButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toEditGoalsVC", sender: self)
    }
    
    @IBAction func dailyGoalsButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func longTermGoalsButtonTapped(_ sender: Any) {
    }
    
} // END OF CLASS


extension GoalsHomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isDailySelected ? dailyGoals.count : longTermGoals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalTableViewCell else { return UITableViewCell() }
        
        let goal = isDailySelected ? dailyGoals[indexPath.row] : longTermGoals[indexPath.row]
        cell.goalTitleLabel.text = goal.title
        cell.isPublicLabel.text = "\(goal.isPrivate)"
    
        return cell
    }
    
        
    
    
}
