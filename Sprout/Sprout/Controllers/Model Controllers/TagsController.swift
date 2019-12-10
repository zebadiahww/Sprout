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
    
    func createTag(with title: String, category: String, completion: @escaping(Bool) -> Void) {
        let newTag = Tag(title: title, category: category, userIDs: nil)
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
    
    func searchAndFetchTag(with searchTerm: String, category: String, completion: @escaping(Bool) -> Void) {
        let query = firebaseDB.collection(TagConstants.typeKey).whereField(TagConstants.titleKey, isEqualTo: searchTerm).whereField(TagConstants.categoryKey, isEqualTo: category)
        query.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
                return
            }
            guard let documents = snapshot?.documents else { completion(false); return }
            
            if documents.count == 0 {
                completion(false)
                return
            }
            
            for document in documents {
                
                if let fetchedTag = Tag(dictionary: document.data()){
                    self.tags.append(fetchedTag)
                }
            }
            completion(true)
        }
    }
    
    func fetchTagsWithTagID(uuid: String, completion:@escaping(Tag?) -> Void) {
        let query = firebaseDB.collection(TagConstants.typeKey).whereField(TagConstants.uuidKey, isEqualTo: uuid)
        query.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(nil)
                return
            }
            guard let documents = snapshot?.documents else { completion(nil); return }
            
            if documents.count == 0 {
                completion(nil)
                return
            }
            
            var fetchedTag: Tag?
            for document in documents {
                if let tag = Tag(dictionary: document.data()) {
                    fetchedTag = tag
                }
            }
            completion(fetchedTag)
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
    
    func updateTag(tag: Tag, UserID: String, completion: @escaping(Bool) -> Void) {
        let ref = firebaseDB.collection(TagConstants.typeKey).document(tag.uuid)
        tag.userIDs?.append(UserID)
        ref.updateData(tag.documentDictionary)
        completion(true)
    }
    
    func deleteTag(tag: Tag, index: Int) {
        let ref = firebaseDB.collection(TagConstants.typeKey).document(tag.uuid)
        ref.delete()
        tags.remove(at: index)

    }
    
} // END OF CLASS
