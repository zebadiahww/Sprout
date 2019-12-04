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
        let ref = firebaseDB.collection(GoalConstants.typeKey).document(goalToSave.uuid)
        ref.setData(goalToSave.documentDictionary) { (error) in
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
        let ref = firebaseDB.collection(GoalConstants.typeKey).document(goal.uuid)
        goal.title = title
        goal.body = body
        goal.date = date
        ref.updateData(goal.documentDictionary)
        completion(true)
    }
    
    func deleteGoal(goal: Goal, index: Int) {
        let ref = firebaseDB.collection(GoalConstants.typeKey).document(goal.uuid)
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
                
                if let fetchedGoal = Goal(dictionay: document.data()) {
                    self.goals.append(fetchedGoal)
                    print(fetchedGoal.title)
                    
                }
            }
            completion(true)
        }
    }
    
} // END OF CLASS
