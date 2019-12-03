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
    
    var firebaseDB = Firestore.firestore()
    
    func authenticateUser(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
        }
    }
    
    func createUser(uid: String, name: String, bio: String, email: String, isMentor: Bool, completion: @escaping(Bool) -> Void) {
        let newUser = User(uid: uid, name: name, bio: bio, isMentor: isMentor, email: email)
        let userToSave : [String : Any] = ["uid" : newUser.uid, "name" : newUser.name, "bio" : newUser.bio, "email" : newUser.email, "isMentor" : newUser.isMentor]
        let ref = firebaseDB.collection("Users").document(newUser.uid)
        ref.setData(userToSave) { (error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
            } else {
                print("user created successfully")
                self.currentUser = newUser
                completion(true)
            }
        }
    }
    
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
        let storageRef = Storage.storage().reference(withPath: "profilepictures/\(currentUser.uid).jpg")
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
        Auth.auth().currentUser?.updateEmail(to: password, completion: { (error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
            }
        })
        completion(true)
    }
    
    func updateProfilePicture(_ picture: UIImage, completion: @escaping(Bool) -> Void) {
        guard let currentUser = currentUser else {completion(false); return }
        let uploadRef = Storage.storage().reference(withPath: "profilepictures/\(currentUser.uid).jpg")
        guard let imageData = picture.jpegData(compressionQuality: 0.5) else { completion(false); return }
        let uploadMetaData = StorageMetadata.init()
        uploadMetaData.contentType = "image/jpeg"
        uploadRef.putData(imageData, metadata: uploadMetaData) { (downloadMetaData, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
            }
            self.firebaseDB.collection("users").document(currentUser.uid).setData([ "profilePicture" : "profilepicture/\(currentUser.uid).jpg"])
            currentUser.profilePicture = picture
            print("picture successfully uploaded")
            completion(true)
        }
    }
    
    func fetchUser(with name: String, bio: String, isMentor: Bool, email: String, completion: @escaping(Bool) -> Void) {
        Auth.auth().signIn(withCustomToken: email) { (authResult, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
            }
            guard let user = authResult else { return }
            let loggedInUser = User(uid: user.user.uid, name: name, bio: bio, isMentor: isMentor, email: email)
            self.currentUser = loggedInUser
            let ref = self.firebaseDB.collection("users").document(user.user.uid)
            ref.getDocument { (snapshot, error) in
                if let error = error {
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                    completion(false)
                }
                guard let name = snapshot?.get("name") as? String else { return }
                self.currentUser?.name = name
                print("successfully fetched user: \(name)")
                completion(true)
            }
        }
    }
    
    func updateUser(with name: String, bio: String, completion: @escaping(Bool) -> Void) {
        guard let userID = currentUser?.uid else { return }
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

    // TO DO: do we need this???
//    func deleteUser(user: User, completion: @escaping(Bool) -> Void) {
//        guard let user = Auth.auth().currentUser else { completion(false); return }
//        user.delete { error in
//            if let error = error {
//                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
//            } else {
//                self.firebaseDB.collection("users").document("\(user.uid)").delete()
//                completion(true)
//            }
//        }
//    }
    
} // END OF CLASS
