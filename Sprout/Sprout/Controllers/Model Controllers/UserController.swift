//
//  MentorController.swift
//  Sprout
//
//  Created by Zebadiah Watson on 11/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import Foundation
import Firebase

class UserController {
    
    static let shared = UserController()
    
    var currentUser: User?
    
    var searchedUsers: [User] = []
    
    var firebaseDB = Firestore.firestore()
    
    //Creates a user and sends verification email
    func authenticateNewUser(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if result != nil {
                completion(true)
            } else {
                print(error?.localizedDescription)
                completion(false)
            }
        }
    }
    
    //Create new user
    func createUser(uuid: String, name: String, bio: String, occupation: String?, isMentor: Bool, profileImage: UIImage?, website: String?, linkedInURL: String?, completion: @escaping(Bool) -> Void) {
        let newUser = User(uuid: uuid, name: name, bio: bio, occupation: occupation, isMentor: isMentor, profileImage: profileImage, tags: TagsController.shared.tags, linkedInURL: linkedInURL, website: website)
        let userToSave : [String : Any] = newUser.documentDictionary
        
        let ref = firebaseDB.collection("Users").document(newUser.uuid)
        ref.setData(userToSave) { (error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
            } else {
                self.currentUser = newUser
                completion(true)
            }
        }
    }
    
    func fetchUser(uuid: String, completion: @escaping(User?) ->Void) {
        let query = firebaseDB.collection(UserConstants.typeKey).whereField(UserConstants.uuidKey, isEqualTo: uuid)
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
            
            var fetchedUser: User?
            for document in documents {
                if let user = User(dictionary: document.data()) {
                    fetchedUser = user
                }
            }
            completion(fetchedUser)
        }
    }
    
    func fetchMentorbyCategory(category: String, completion: @escaping(Bool) -> Void) {
        let query = firebaseDB.collection(TagConstants.typeKey).whereField(TagConstants.categoryKey, isEqualTo: category)
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
            var mentors: [User] = []
            
            for document in documents {
                guard let userIDs = document.value(forKey: TagConstants.userIDsKey) as? [String] else { return }
                for uuid in userIDs {
                    self.fetchUser(uuid: uuid) { (results) in
                        if let results = results {
                            mentors.append(results)
                        }
                    }
                }
            }
            self.searchedUsers = mentors
            completion(true)
        }
    }
    
    func fetchMentorsBySearchTerm(searchTerm: String, completion: @escaping(Bool) -> Void) {
        let query = firebaseDB.collection(TagConstants.typeKey).whereField(TagConstants.categoryKey, isEqualTo: searchTerm).whereField(TagConstants.titleKey, isEqualTo: searchTerm)
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
            var mentors: [User] = []
            
            for document in documents {
                guard let userIDs = document.value(forKey: TagConstants.userIDsKey) as? [String] else { return }
                for uuid in userIDs {
                    self.fetchUser(uuid: uuid) { (results) in
                        if let results = results {
                            mentors.append(results)
                        }
                    }
                }
            }
            self.searchedUsers = mentors
            completion(true)
        }
    }
    
    func fetchMentorForPupil(user: String, completion: @escaping(Bool) -> Void) {
        guard let user = UserController.shared.currentUser,
            let mentors = user.mentorSearchDict else {return}
        var fetchedUsers: [User] = []
        var fetchedTags: [Tag] = []
        for mentor in mentors {
            //            let query = firebaseDB.collection(UserConstants.typeKey).whereField(UserConstants.uuidKey, isEqualTo: mentor.key )
            self.fetchUser(uuid: mentor.key) { (result) in
                if let result = result {
                    fetchedUsers.append(result)
                }
            }
            TagsController.shared.fetchTagsWithTagID(uuid: mentor.value) { (result) in
                if let result = result {
                    fetchedTags.append(result)
                }
            }
            
            for num in 0...(fetchedUsers.count - 1) {
                user.mentors?.updateValue(fetchedTags[num], forKey: fetchedUsers[num])
            }
        }
    }
    
    func fetchPupilsForMentor(completion: @escaping(Bool) -> Void) {
        guard let user = UserController.shared.currentUser,
            let pupils = user.pupilSearchDict else {return}
        var fetchedUsers: [User] = []
        var fetchedTags: [Tag] = []
        for pupil in pupils {
            self.fetchUser(uuid: pupil.key) { (result) in
                if let result = result {
                    fetchedUsers.append(result)
                }
            }
            TagsController.shared.fetchTagsWithTagID(uuid: pupil.value) { (result) in
                if let result = result {
                    fetchedTags.append(result)
                }
            }
            
            for num in 0...(fetchedUsers.count - 1) {
                user.pupils?.updateValue(fetchedTags[num], forKey: fetchedUsers[num])
            }
            
        }
    }
    
    func manualSignIn(withEmail email: String, password: String, completion: @escaping(Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
                return
            }
            
            guard let user = result?.user else {return}
            
            let ref = self.firebaseDB.collection("users").document(user.uid)
            ref.getDocument { (snapshot, error) in
                if let error = error {
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                    completion(false)
                    return
                }
                guard let document = snapshot,
                    let documentDictionary = document.data()
                    else {completion(false); return}
                let currentUser = User(dictionary: documentDictionary)
                self.currentUser = currentUser
                completion(true)
            }
        }
    }
    
    func signInCurrentUser(completion: @escaping(Bool) -> Void) {
        
        guard let user = Auth.auth().currentUser else {
            completion(false)
            return
        }
        let ref = firebaseDB.collection("users").document(user.uid)
        ref.getDocument { (snapshot, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
            }
            
            guard let document = snapshot else {
                completion(false)
                return
            }
            if let documentDictionary = document.data() {
                let user = User(dictionary: documentDictionary)
                self.currentUser = user
                completion(true)
            }
            completion(false)
            return
        }
    }
    
    // resend email verification
    func sendEmailVerification(completion: @escaping (Bool) -> Void) {
        Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
            }
            print("sent email verification")
            completion(true)
        })
    }
    
    func checkEmailVerification(completion: @escaping(Bool) -> Void) {
        guard let isVerified = Auth.auth().currentUser?.isEmailVerified else { return }
        completion(isVerified)
    }
    
    func sendResetPasswordEmail(to email: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
            }
            print("successfully sent email to reset password")
            completion(true)
        }
    }
    
    func fetchProfilePhoto(completion: @escaping(Bool) -> Void) {
        guard let currentUser = currentUser else { return }
        let storageRef = Storage.storage().reference(withPath: "profilepictures/\(currentUser.uuid).jpg")
        storageRef.getData(maxSize: 4 * 1024 * 1024) { (data, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
            }
            if let data = data {
                let downloadedimage = UIImage(data: data)
                currentUser.profilePicture = downloadedimage
                print("succesfully fetched image")
                completion(true)
            }
        }
    }
    
    func signOutUser(user: User, completion: @escaping(_ success: Bool,_ error: Error? ) -> Void) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("error signing out")
            completion(false, signOutError)
        }
        completion(true, nil)
    }
    
    func updatePassword(_ password: String, completion: @escaping(Bool) -> Void) {
        Auth.auth().currentUser?.updatePassword(to: password, completion: { (error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
            }
        })
        completion(true)
    }
    
    func updateEmail(_ email: String, completion: @escaping(Bool) -> Void) {
        Auth.auth().currentUser?.updateEmail(to: email, completion: { (error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
            }
        })
        completion(true)
    }
    
    func updateProfilePicture(_ picture: UIImage, completion: @escaping(Bool) -> Void) {
        guard let currentUser = currentUser else {completion(false); return }
        let uploadRef = Storage.storage().reference(withPath: "profilepictures/\(currentUser.uuid).jpg")
        guard let imageData = picture.jpegData(compressionQuality: 0.5) else { completion(false); return }
        let uploadMetaData = StorageMetadata.init()
        uploadMetaData.contentType = "image/jpeg"
        uploadRef.putData(imageData, metadata: uploadMetaData) { (downloadMetaData, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
            }
            self.firebaseDB.collection("users").document(currentUser.uuid).setData([ "profilePicture" : "profilepicture/\(currentUser.uuid).jpg"])
            currentUser.profilePicture = picture
            print("picture successfully uploaded")
            completion(true)
        }
    }
    
    func updateUser(with name: String, bio: String, completion: @escaping(Bool) -> Void) {
        guard let userID = currentUser?.uuid else { return }
        firebaseDB.collection("users").document(userID).setData(["name" : name, "bio" : bio]) { (error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
            }
            self.currentUser?.name = name
            self.currentUser?.bio = bio
            print("updated user info")
        }
    }
    
    func blockUser(user: User, completion: @escaping(Bool) -> Void) {
        guard let currentUser = currentUser else {return}
        currentUser.blockedUsers?.append(user.uuid)
        
        firebaseDB.collection("users").document(currentUser.uuid).setData(currentUser.documentDictionary) { (error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                return completion(false)
            }
            print("User updated successfully")
            completion(true)
        }
    }
} // END OF CLASS
