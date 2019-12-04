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
            // fetch userdata
            performSegue(withIdentifier: "toLogin", sender: self)
        } else {
            UserController.shared.signInCurrentUser { (success) in
                if success {
                    self.performSegue(withIdentifier: "toHomeScreen", sender: self)
                } else {
                    self.performSegue(withIdentifier: "toLogin", sender: self)
                }
            }
        }
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
