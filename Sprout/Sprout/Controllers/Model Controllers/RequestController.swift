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
    
    var requests: [Request] = []
    
    var firebaseDB = Firestore.firestore()
    
    func createRequest(titleText: String, messageText: String, completion: @escaping(Bool) -> Void) {
        let requestToSave = Request(title: titleText, message: messageText)
        let dataToSave: [String: Any] = ["title": requestToSave.title, "message": requestToSave.message, "isApproved": requestToSave.isApproved]
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
        firebaseDB.collection("Request").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
                return
            }
            for document in snapshot!.documents {
                guard let title = document.get("title") as? String,
                    let message = document.get("message") as? String,
                    let requestID = document.get("requestID") as? String
                    else { return }
                let fetchedRequest = Request(title: title, message: message, uuid: requestID)
                self.requests.append(fetchedRequest)
                print(fetchedRequest.title)
                completion(true)
            }
        }
    }
} // END OF CLASS
