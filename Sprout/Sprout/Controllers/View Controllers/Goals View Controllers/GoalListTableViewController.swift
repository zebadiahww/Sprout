//
//  GoalListTableViewController.swift
//  Sprout
//
//  Created by Zebadiah Watson on 12/5/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class GoalListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return GoalController.shared.goals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GoalCell", for: indexPath) as? GoalTableViewCell else { return UITableViewCell() }

        let goal = GoalController.shared.goals[indexPath.row]
        cell.goalTitleLabel.text = goal.title
        cell.isPublicLabel.text = "\(goal.isPrivate)"
        

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let goalToDelete = GoalController.shared.goals[indexPath.row]
            GoalController.shared.deleteGoal(goal: goalToDelete) { (success) in
                if success {
                    DispatchQueue.main.async {
                        tableView.deleteRows(at: [indexPath], with: .automatic)
                    }
                }
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "" {
            guard let GoalTableViewCell = tableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? CreateGoalTableViewController else { return }
            
            let goalToSend = GoalController.shared.goals[GoalTableViewCell.row]
            
            destinationVC.goalReceiver = goalToSend
        }
    }
    
} // END OF CLASS
