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
    
    var currentUser: User?
    
    var firebaseDB = Firestore.firestore()
    
    // TODO add new parameters into functions
    func createGoal(title: String, body: String, userID: String, isComplete: Bool, isPrivate: Bool, isDaily: Bool, date: Date?, uuid: String, icon: String, iconColor: String, completion: @escaping(Bool) -> Void) {
        
        let goalToSave = Goal(title: title, body: body, userID: userID, isComplete: isComplete, isPrivate: isPrivate, isDaily: isDaily, date: date, uuid: uuid, icon: icon, iconColor: iconColor)
        var dataToSave: [String : Any] = ["title" : goalToSave.title, "body" : goalToSave.body, "userID" : goalToSave.userID, "isComplete" : goalToSave.isComplete, "isPrivate" : goalToSave.isPrivate, "isDaily" : goalToSave.isDaily, "GoalID" : goalToSave.uuid, "icon" : goalToSave.icon, "iconColor" : goalToSave.iconColor]
        if let date = goalToSave.date {
            dataToSave.updateValue(date, forKey: "date")
        }
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
    
    func updateGoal(goal: Goal, title: String, date: Date?, body: String, completion: @escaping(Bool) -> Void) {
        var goalToUpdate: [String : Any] = ["title" : title, "body" : body]
        if let date = date {
            goalToUpdate.updateValue(date, forKey: "date")
        }
        let ref = firebaseDB.collection("Goal").document(goal.uuid)
        ref.updateData(goalToUpdate)
        goal.title = title
        goal.body = body
        goal.date = date
        completion(true)
    }
    
    func deleteGoal(goal: Goal, index: Int) {
        let ref = firebaseDB.collection("Goal").document(goal.uuid)
        ref.delete()
        goals.remove(at: index)
    }
    
    func fetchGoal( completion: @escaping(Bool) -> Void) {
        guard let user = currentUser else { return }
        let query = firebaseDB.collection("Goal").whereField("userID", isEqualTo: user.uuid)
            query.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
                return
            }
            for document in snapshot!.documents {
                guard let title = document.get("title") as? String,
                    let body = document.get("body") as? String,
                    let userID = document.get("userID") as? String,
                    let goalID = document.get("GoalID") as? String,
                    let isComplete = document.get("isComplete") as? Bool,
                    let isPrivate = document.get("isPrivate") as? Bool,
                    let isDaily = document.get("isDaily") as? Bool,
                    let icon = document.get("icon") as? String,
                    let iconColor = document.get("iconColor") as? String
                    else { return }
                let date = document.get("date") as? Date
                let fetchedGoal = Goal(title: title, body: body, userID: userID, isComplete: isComplete, isPrivate: isPrivate, isDaily: isDaily, date: date, uuid: goalID, icon: icon, iconColor: iconColor)
                self.goals.append(fetchedGoal)
                print(fetchedGoal.title)
                completion(true)
            }
        }
    }
    
} // END OF CLASS
