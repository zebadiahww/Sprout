//
//  RequestController.swift
//  Sprout
//
//  Created by Zebadiah Watson on 11/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import Foundation
import Firebase

class RequestController {
    
    static let shared = RequestController()
    
    var currentUser: User?
    
    var requests: [Request] = []
    
    var firebaseDB = Firestore.firestore()
    
    func createRequest(titleText: String, messageText: String, userID: String,  completion: @escaping(Bool) -> Void) {
        let requestToSave = Request(title: titleText, message: messageText, userID: userID)
        let dataToSave: [String: Any] = ["title": requestToSave.title, "message": requestToSave.message, "userID" : requestToSave.userID, "isApproved": requestToSave.isApproved]
        let ref = firebaseDB.collection("Request").document(requestToSave.uuid)
        ref.setData(dataToSave) { (error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            } else {
                print("data has been saved")
                self.requests.append(requestToSave)
                completion(true)
            }
        }
    }
    
    func deleteRequest(request: Request, index: Int) {
        let ref = firebaseDB.collection("Request").document(request.uuid)
        ref.delete()
        requests.remove(at: index)
    }
    
    func fetchRequest(completion: @escaping(Bool) -> Void) {
        guard let user = currentUser else { return }
        let query = firebaseDB.collection("Request").whereField("userID", isEqualTo: user.uid)
            query.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
                return
            }
            for document in snapshot!.documents {
                guard let title = document.get("title") as? String,
                    let message = document.get("message") as? String,
                    let userID = document.get("userID") as? String,
                    let requestID = document.get("requestID") as? String
                    else { return }
                let fetchedRequest = Request(title: title, message: message, uuid: requestID, userID: userID)
                self.requests.append(fetchedRequest)
                print(fetchedRequest.title)
                completion(true)
            }
        }
    }
} // END OF CLASS
