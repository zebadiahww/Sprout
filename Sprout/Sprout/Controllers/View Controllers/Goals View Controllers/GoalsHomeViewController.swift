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
        setupViews()
        goalsTableView.delegate = self
        goalsTableView.dataSource = self
        GoalController.shared.fetchGoal { (success) in
            if success {
                self.longTermGoals = GoalController.shared.goals.filter({ $0.isDaily == false })
                self.dailyGoals = GoalController.shared.goals.filter({  $0.isDaily == true })
                self.goalsTableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.longTermGoals = GoalController.shared.goals.filter({ $0.isDaily == false })
        self.dailyGoals = GoalController.shared.goals.filter({  $0.isDaily == true })
        goalsTableView.reloadData()
    }
    
    //MARK: - Class Methods
    func setupViews() {
        pageIDLabel.font = UIFont(name: "Avenir", size: 40)
        pageIDLabel.text = "Goals"
        
        goalTypeLabel.font = UIFont(name: "Avenir", size: 20)
        goalTypeLabel.text = "Daily Goals"
        
        
        dailyGoalsButton.layer.cornerRadius = dailyGoalsButton.frame.height/2
        dailyGoalsButton.backgroundColor = .middleGreen
        
        longTermGoalsButton.layer.cornerRadius = longTermGoalsButton.frame.height/2
        longTermGoalsButton.backgroundColor = .lightGreen
        
        
    }
    
    
    
    //MARK: - Actions
    @IBAction func dailyGoalsButtonTapped(_ sender: Any) {
        longTermGoalsButton.isEnabled = true
        dailyGoalsButton.isEnabled = false
        longTermGoalsButton.backgroundColor = .lightGreen
        dailyGoalsButton.backgroundColor = .middleGreen
        goalTypeLabel.text = "Daily Goals"
        GoalController.shared.fetchGoal { (success) in
            if success {
                self.longTermGoals = GoalController.shared.goals.filter({ $0.isDaily == false })
                self.dailyGoals = GoalController.shared.goals.filter({  $0.isDaily == true })
                self.goalsTableView.reloadData()
            }
        }
    }
    
    @IBAction func longTermGoalsButtonTapped(_ sender: Any) {
        longTermGoalsButton.isEnabled = false
        dailyGoalsButton.isEnabled = true
        longTermGoalsButton.backgroundColor = .middleGreen
        dailyGoalsButton.backgroundColor = .lightGreen
        goalTypeLabel.text = "Milestone Goals"
        GoalController.shared.fetchGoal { (success) in
            if success {
                self.longTermGoals = GoalController.shared.goals.filter({ $0.isDaily == false })
                self.dailyGoals = GoalController.shared.goals.filter({  $0.isDaily == true })
                self.goalsTableView.reloadData()
            }
        }
    }
    
} // END OF CLASS


extension GoalsHomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isDailySelected ? dailyGoals.count : longTermGoals.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let goalToDelete = GoalController.shared.goals[indexPath.row]
//            guard let index = GoalController.shared.goals.firstIndex(of: goalToDelete)
//                else { return }
            GoalController.shared.deleteGoal(goal: goalToDelete) { (success) in
                if success {
//                    GoalController.shared.goals.remove(at: index)
                    self.isDailySelected ?
                        self.dailyGoals.remove(at: indexPath.row) :
                        self.longTermGoals.remove(at: indexPath.row)
                    DispatchQueue.main.async {
                        tableView.deleteRows(at: [indexPath], with: .automatic)
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GoalCell", for: indexPath) as? GoalTableViewCell else { return UITableViewCell() }
        
        let goal = isDailySelected ? dailyGoals[indexPath.row] : longTermGoals[indexPath.row]
        
        cell.goalTitleLabel.text = goal.title
        cell.isPublicLabel.text = goal.isPrivate ? "Private" : "Public"
        
        cell.finishButton.layer.cornerRadius = cell.finishButton.frame.height/2
        cell.finishButton.backgroundColor = .middleGreen
        cell.finishButton.titleLabel?.text = "Finish"
        cell.finishButton.titleLabel?.textColor = .white
        cell.finishButton.tintColor = .white
        
        return cell
    }
}
