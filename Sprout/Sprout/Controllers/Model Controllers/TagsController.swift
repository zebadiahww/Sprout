//
//  TagsController.swift
//  Sprout
//
//  Created by Zebadiah Watson on 11/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import Foundation
import Firebase

class TagsController {
    
    var tags: [Tag] = []
    
    var currentUser: User?
    
    static let shared = TagsController()
    
    var firebaseDB = Firestore.firestore()
    
    func createTag(with title: String, category: String, userID: String, completion: @escaping(Bool) -> Void) {
        let newTag = Tag(title: title, category: category, userIDs: [userID])
        let ref = firebaseDB.collection(TagConstants.typeKey).document(newTag.uuid)
        ref.setData(newTag.documentDictionary) { (error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
            } else {
                print("New Tag has been saved")
                self.tags.append(newTag)
                completion(true)
            }
        }
    }
    
    func searchAndFetchTag(with searchTerm: String, completion: @escaping(Bool) -> Void) {
        let query = firebaseDB.collection(TagConstants.typeKey).whereField(TagConstants.titleKey, arrayContains: searchTerm.lowercased())
        query.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
                return
            }
            for document in snapshot!.documents {
                
                if let fetchedTag = Tag(dictionary: document.data()){
                    self.tags.append(fetchedTag)
                }
            }
            completion(true)
        }
    }
    
    func fetchTag(completion: @escaping(Bool) -> Void) {
        guard let user = currentUser else { return }
        let query = firebaseDB.collection(TagConstants.typeKey).whereField(TagConstants.userIDsKey, arrayContains: user.uuid)
        query.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
                return
            }
            for document in snapshot!.documents {
              
                if let fetchedTag = Tag(dictionary: document.data()) {
                    user.tags?.append(fetchedTag)
                    print(fetchedTag.title)
                }
            }
            completion(true)
        }
    }
    
    func updateTag(tag: Tag, title: String, completion: @escaping(Bool) -> Void) {
        let tagToUpdate: [String : Any] = [TagConstants.titleKey : title]
        let ref = firebaseDB.collection(TagConstants.typeKey).document(tag.uuid)
        ref.updateData(tagToUpdate)
        tag.title = title
        completion(true)
    }
    
    func deleteTag(tag: Tag, index: Int) {
        let ref = firebaseDB.collection(TagConstants.typeKey).document(tag.uuid)
        ref.delete()
        tags.remove(at: index)

    }
    
} // END OF CLASS
