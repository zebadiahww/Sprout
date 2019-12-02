//
//  GoalsController.swift
//  Sprout
//
//  Created by Zebadiah Watson on 11/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import Foundation
import Firebase

class GoalController {
    
    var goals: [Goal] = []
    
    var firebaseDB = Firestore.firestore()
    
    
    func createGoal(title: String, body: String, completion: @escaping(Bool) -> Void) {
        let goalToSave = Goal(title: title, body: body)
        let dataToSave: [String : Any] = ["title" : goalToSave.title, "body" : goalToSave.body, "GoalID" : goalToSave.uuid]
        let ref = firebaseDB.collection("Goal").document(goalToSave.uuid)
        ref.setData(dataToSave) { (error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
            } else {
                print("Goal data has been saved")
                self.goals.append(goalToSave)
                completion(true)
            }
        }
    }
    
    func updateGoal(goal: Goal, title: String, body: String, completion: @escaping(Bool) -> Void) {
        let goalToUpdate: [String : Any] = ["title" : title, "body" : body]
        let ref = firebaseDB.collection("Goal").document(goal.uuid)
        ref.updateData(goalToUpdate)
        goal.title = title
        goal.body = body
        completion(true)
    }
    
    func deleteGoal(goal: Goal, index: Int) {
        let ref = firebaseDB.collection("Goal").document(goal.uuid)
        ref.delete()
        goals.remove(at: index)
    }
    
    func fetchGoal( completion: @escaping(Bool) -> Void) {
        firebaseDB.collection("Goal").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
                return
            }
            for document in snapshot!.documents {
                let title = document.get("title") as! String
                let body = document.get("body") as! String
                let goalID = document.get("GoalID") as! String
                let fetchedGoal = Goal(title: title, body: body, uuid: goalID)
                self.goals.append(fetchedGoal)
                print(fetchedGoal.title)
                completion(true)
            }
        }
    }
    
} // END OF CLASS
