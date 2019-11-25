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
    
    var firebasedb = Firestore.firestore()
    
    func createUser(email: String, password: String, completion: @escaping(Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
            }
            guard let user = authResult else { return }
            let newUser = User(uid: user.user.uid, email: email)
            self.currentUser = newUser
            completion(true)
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
                currentUser.profileImage = downloadedimage
                print("succesfully fetched image")
                completion(true)
            }
        }
    }
    
    func signOutUser() {
        
    }
    
    func updatePassword() {
        
    }
    
    func updateProfilePicture() {
        
    }
    
    func fetchUser(with email: String, password: String, completion: @escaping(Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(false)
            }
            guard let user = authResult else { return }
            let loggedInUser = User(uid: user.user.uid, email: email)
            self.currentUser = loggedInUser
            let ref = self.firebasedb.collection("users").document(user.user.uid)
            ref.getDocument { (snapshot, error) in
                if let error = error {
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                    completion(false)
                }
                let name = snapshot?.get("name") as! String
                self.currentUser?.name = name
                print("successfully fetched user: \(name)")
                completion(true)
            }
        }
    }
    
    func updateUser() {
        
    }
    
    func deleteUser() {
        
    }
    
} // END OF CLASS
