//
//  MentorRequestViewController.swift
//  Sprout
//
//  Created by Travis Wheeler on 12/12/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class MentorRequestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

extension MentorRequestViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserController.shared.currentUser?.requests?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pupilRequest", for: indexPath) as? MentorRequestTableViewCell,
            let currentUser = UserController.shared.currentUser
            else { return UITableViewCell() }
        
        let pupil = currentUser.pupilsArray[indexPath.row]
        cell.pupilImage.image = pupil.profilePicture
        cell.pupilNameLabel.text = pupil.name
        
        return cell
    }
}
