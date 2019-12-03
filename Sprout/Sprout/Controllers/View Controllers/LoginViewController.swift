//
//  LoginViewController.swift
//  Sprout
//
//  Created by Zebadiah Watson on 11/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    
    //MARK: - Outlets
 
    @IBOutlet weak var pageIDLabel: UILabel!
    @IBOutlet weak var userTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var pageToggleButton: UIButton!
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
//            Auth.auth().currentUser?.uid
        }
    }
    
    
    // MARK: - Actions
//    @IBAction func loginButtonTapped(_ sender: Any) {
//        guard let email = emailTextField.text, !email.isEmpty,
//            let password = passwordTextField.text, !password.isEmpty else { return }
//
//        UserController.shared.createUser(email: email) { (success) in
//            if success {
//                // do something here
//            }
//        }
//    }
    
    
    @IBAction func accountTypeValueChanged(_ sender: UISegmentedControl) {
    }
    
    @IBAction func pageToggleTapped(_ sender: UIButton) {
    }
    
    
    func showCreateProfileVC() {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "CreateEditProfileViewController", bundle: nil)
            guard let vc = storyboard.instantiateInitialViewController() else {
                return }
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    func fetchUser() {
//        guard let username = Auth.auth().currentUser?.email,
//            let password = Auth.auth().currentUser
//
//        UserController.shared.fetchUser(with: <#T##String#>, password: <#T##String#>, completion: <#T##(Bool) -> Void#>)
    }
    
} // End Of Class
