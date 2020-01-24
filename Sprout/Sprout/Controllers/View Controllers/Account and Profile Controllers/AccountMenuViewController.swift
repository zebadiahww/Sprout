//
//  AccountMenuViewController.swift
//  Sprout
//
//  Created by Marcus Armstrong on 12/13/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit
import FirebaseAuth

class AccountMenuViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews() {
        guard let user = UserController.shared.currentUser else {return}
        nameLabel.text = user.name
    }
    
    
    @IBAction func signOutButtonTapped(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Unable to sign out current user")
            
        }
        //self.navigationController?.viewControllers.removeAll()
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
                           guard let initialVC = storyboard.instantiateInitialViewController() else { return }
                           initialVC.modalPresentationStyle = .fullScreen
                           self.present(initialVC, animated: true, completion: nil)
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
