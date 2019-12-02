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
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var accountTypeLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var accountTypeButton: UIButton!
    
    @IBOutlet weak var sproutImageView: UIImageView!
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            Auth.auth().currentUser?.uid
        }
    }
    
    
    // MARK: - Actions
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty else { return }
        
        UserController.shared.createUser(email: email, password: password) { (success) in
            if success {
                // do something here
            }
        }
    }
    
    
    @IBAction func accountTypeButtonTapped(_ sender: Any) {
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
