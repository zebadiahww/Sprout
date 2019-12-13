//
//  UserCheckViewController.swift
//  Sprout
//
//  Created by Marcus Armstrong on 12/3/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit
import FirebaseAuth

class UserCheckViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser == nil {
            performSegue(withIdentifier: "toLogin", sender: self)
        } else {
            UserController.shared.signInCurrentUser { (success) in
                if success {
                    guard let userType = UserController.shared.currentUser?.isMentor else {return}
                    switch userType {
                    case true:
                        self.performSegue(withIdentifier: "toMentorHome", sender: self)
                    case false:
                        self.performSegue(withIdentifier: "toPupilHome", sender: self)
                    }
                    
                } else {
                    self.performSegue(withIdentifier: "toLogin", sender: self)
                }
            }
        }
    }
}
