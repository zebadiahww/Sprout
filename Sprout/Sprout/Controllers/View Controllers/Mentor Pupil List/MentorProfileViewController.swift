//
//  MentorProfileViewController.swift
//  Sprout
//
//  Created by Travis Wheeler on 12/12/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class MentorProfileViewController: UIViewController {
    
    @IBOutlet weak var pupilListTableView: UITableView!
    @IBOutlet weak var mentorImage: UIImageView!
    @IBOutlet weak var mentorLabel: UILabel!
    @IBOutlet weak var myPupilsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViews()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Class Methods
    func setUpViews() {
        self.mentorImage.layer.cornerRadius = mentorImage.frame.height/2
        self.mentorLabel.layer.cornerRadius = mentorLabel.frame.height/6
    }
      
      func fetchMentorData() {
          // need mentor's profile image
      }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension MentorProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserController.shared.currentUser?.pupils?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pupilCell", for: indexPath) as? MentorPupilListTableViewCell,
            let currentUser = UserController.shared.currentUser
            else { return UITableViewCell() }
        
        let pupil = currentUser.pupilsArray[indexPath.row]
        cell.pupilImage.image = pupil.profilePicture
        cell.pupilNameLabel.text = pupil.name
        
        return cell
    }
}
