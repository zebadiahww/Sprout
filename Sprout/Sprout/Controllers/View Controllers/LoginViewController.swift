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
    
    var isSignUp: Bool = true
    
    //MARK: - Outlets
    
    @IBOutlet weak var pageIDLabel: UILabel!
    @IBOutlet weak var userTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var pageToggleButton: UIButton!
    @IBOutlet weak var emailBorderLabel: UILabel!
    @IBOutlet weak var passwordBorderLabel: UILabel!
    @IBOutlet weak var emailBorder: UIView!
    @IBOutlet weak var passwordBorder: UIView!
    @IBOutlet weak var haveAnAccountLabel: UILabel!
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
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
    
    
    @IBAction func accountTypeValueChanged(_ sender: UISegmentedControl) {
    }
    
    @IBAction func pageToggleTapped(_ sender: UIButton) {
        
        if isSignUp == true {
            UIView.animate(withDuration: 0.2 ) {
                self.toggleToSignUp()
                self.isSignUp = false
            }
        } else {
            UIView.animate(withDuration: 0.2 ) {
                self.toggleToLogin()
                self.isSignUp = true
            }
        }
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
    
    //MARK: - Class Methods
    func setupViews() {
        self.pageIDLabel.font = UIFont(name: "Avenir", size: 14)
        self.emailBorder.layer.cornerRadius = emailBorder.frame.height/12
        self.emailBorder.layer.borderWidth = 1
        self.passwordBorder.layer.cornerRadius = passwordBorder.frame.height/12
        self.passwordBorder.layer.borderWidth = 1
        self.actionButton.layer.cornerRadius = actionButton.frame.height/2
    }
    
    func toggleToLogin() {
        self.pageIDLabel.text = "login"
        self.userTypeSegmentedControl.isHidden = true
        self.actionButton.setTitle("Login", for: .normal)
        self.haveAnAccountLabel.text = "Don't have an account?"
        self.pageToggleButton.setTitle("Register now.", for: .normal)
    }
    
    func toggleToSignUp() {
        self.pageIDLabel.text = "sign up"
        self.userTypeSegmentedControl.isHidden = false
        self.actionButton.setTitle("Sign Up", for: .normal)
        self.haveAnAccountLabel.text = "Already have an account?"
        self.pageToggleButton.setTitle("Login now.", for: .normal)
    }
    
    
    //    func fetchUser() {
    //        guard let username = Auth.auth().currentUser?.email,
    //            let password = Auth.auth().currentUser
    //
    //        UserController.shared.fetchUser(with: <#T##String#>, password: <#T##String#>, completion: <#T##(Bool) -> Void#>)
    //    }
    
} // End Of Class
