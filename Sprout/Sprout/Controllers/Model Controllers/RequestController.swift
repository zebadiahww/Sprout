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
    
    func createRequest(titleText: String, messageText: String, requestSenderID: String, mentorID: String,  completion: @escaping(Bool) -> Void) {
        let requestToSave = Request(title: titleText, message: messageText, requestSenderID: requestSenderID, mentorID: mentorID)
        let ref = firebaseDB.collection(RequestConstants.typeKey).document(requestToSave.uuid)
        ref.setData(requestToSave.documentDictionary) { (error) in
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
        let ref = firebaseDB.collection(RequestConstants.typeKey).document(request.uuid)
        ref.delete()
        requests.remove(at: index)
    }
    
    func fetchRequest(completion: @escaping(Bool) -> Void) {
        guard let user = currentUser else { return }

        let query = firebaseDB.collection(RequestConstants.typeKey).whereField(RequestConstants.mentorIDKey, isEqualTo: user.uuid)
            query.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
                return
            }
            for document in snapshot!.documents {
                
                if let fetchedRequest = Request(dictionary: document.data()) {
                    self.requests.append(fetchedRequest)
                    print(fetchedRequest.title)
                }
            }
            completion(true)
        }
    }
} // END OF CLASS
