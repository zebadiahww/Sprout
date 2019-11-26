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
    
    var firebaseDB = Firestore.firestore()
    
    func createTag(with title: String, category: String, completion: @escaping(Bool) -> Void) {
        let newTag = Tag(title: title, category: category)
        let dataToSave:[String : Any] = ["title" : newTag.title, "category" : newTag.category, "tagID" : newTag.uuid]
        let ref = firebaseDB.collection("Tag").document(newTag.uuid)
        ref.setData(dataToSave) { (error) in
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
    
    func fetchTag(completion: @escaping(Bool) -> Void) {
        firebaseDB.collection("Tag").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
                return
            }
            for document in snapshot!.documents {
                let title = document.get("title") as! String
                let category = document.get("category") as! String
                let tagID = document.get("tagID") as! String
                let fetchedTag = Tag(title: title, category: category, uuid: tagID)
                self.tags.append(fetchedTag)
                print(fetchedTag.title)
                completion(true)
            }
        }
    }
    
    func updateTag(tag: Tag, title: String, category: String, completion: @escaping(Bool) -> Void) {
        let tagToUpdate: [String : Any] = ["title" : title, "category" : category ]
        let ref = firebaseDB.collection("Tag").document(tag.uuid)
        ref.updateData(tagToUpdate)
        tag.title = title
        tag.category = category
        completion(true)
        
    }
    
    func deleteTag(tag: Tag, index: Int) {
        let ref = firebaseDB.collection("Tag").document(tag.uuid)
        ref.delete()
        tags.remove(at: index)
        
    }
    
} // END OF CLASS
