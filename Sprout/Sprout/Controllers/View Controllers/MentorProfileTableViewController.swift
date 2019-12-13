//
//  MentorProfileTableViewController.swift
//  Sprout
//
//  Created by Marcus Armstrong on 12/12/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class MentorProfileTableViewController: UITableViewController {
    
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var requestMentorButton: UIButton!
    @IBOutlet weak var linkedInButton: UIButton!
    @IBOutlet weak var mentorLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var blockButton: UIButton!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var expertiseLabel: UILabel!
    @IBOutlet weak var tagsCollectionView: UICollectionView!
    @IBOutlet weak var pupilLabel: UILabel!
    @IBOutlet weak var pupilCollectionView: UICollectionView!
    
    var profileUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pupilCollectionView.delegate = self
        pupilCollectionView.dataSource = self
        tagsCollectionView.dataSource = self
        
    }
    
    @IBAction func requestMentorButtonTapped(_ sender: UIButton) {
        presentMentorRequest()
    }
    
    @IBAction func linkedInButtonTapped(_ sender: UIButton) {
        guard let mentor = profileUser,
            let linkedInURLString = mentor.linkedInURL,
            let url = URL(string: linkedInURLString)
        else {return}
        UIApplication.shared.open(url)
    }
    
    @IBAction func blockButtonTapped(_ sender: UIButton) {
        guard let user = profileUser else {return}
        UserController.shared.blockUser(user: user) { (success) in
            if success {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    func updateViews() {
        guard let user = profileUser else {return}
        if user.linkedInURL == nil {
            linkedInButton.isHidden = true
        }
        profilePhotoImageView.layer.cornerRadius = profilePhotoImageView.frame.height/2
        profilePhotoImageView.image = user.profilePicture
        mentorLabel.layer.cornerRadius = mentorLabel.frame.height/12
        nameLabel.text = user.name
        bioTextView.text = user.bio
    }
}

extension MentorProfileTableViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let user = profileUser else {return 0}
        if collectionView == tagsCollectionView {
            return user.tags?.count ?? 0
        } else if collectionView == pupilCollectionView {
            return user.pupils?.count ?? 0
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let pupils = profileUser?.pupils else {return UICollectionViewCell()}
        let pupilsArray = pupils.compactMap({$0.key})
        if collectionView == pupilCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pupilCell", for: indexPath) as? PupilCollectionViewCell else {return UICollectionViewCell()}
            let pupil = pupilsArray[indexPath.row]
            cell.updateViews(pupil: pupil)
            return cell
        }
        if collectionView == tagsCollectionView {
            guard let userTags = profileUser?.tags else {return UICollectionViewCell()}
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagCell", for: indexPath) as? ForeignTagCollectionViewCell else {return UICollectionViewCell()}
            let tag = userTags[indexPath.row]
            cell.updateLabel(title: tag.title)
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == pupilCollectionView {
            return CGSize(width: collectionView.frame.height, height: collectionView.frame.width/3)
        }
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}


extension MentorProfileTableViewController {
    
    func presentMentorRequest() {
        guard let mentor = profileUser else {return}
        let alertController = UIAlertController(title: "Request Mentor", message: "Ask \(mentor.name) to be your mentor", preferredStyle: .alert)
        alertController.addTextField { (_) in
        }
        let sendAction = UIAlertAction(title: "Send Request", style: .default) { (action) in
            guard let currentUser = UserController.shared.currentUser,
                let textField = alertController.textFields?[0],
                let messageText = textField.text
                else {return}
            
            RequestController.shared.createRequest(titleText: "You've recieved a request from \(currentUser.name)", messageText: messageText, requestSenderID: currentUser.uuid, mentorID: mentor.uuid) { (success) in
                print("Request sent successfully")
                self.requestMentorButton.setTitle("Request Sent", for: .normal)
                self.requestMentorButton.setImage(UIImage(named: "checkmark.circle"), for: .normal)
                self.requestMentorButton.isEnabled = false
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(sendAction)
        
        self.present(alertController, animated: true)
    }
}
