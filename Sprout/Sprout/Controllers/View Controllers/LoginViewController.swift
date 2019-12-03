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
    
    var isMentor = false
    
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

            // fetch userdata
            //perform segue
        }
    }
    
    
    // MARK: - Actions

    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty else { return }
        if !isSignUp {
            performSegue(withIdentifier: "toProfileCreation", sender: self)
        } else {
            
        }
    }
    
    
    @IBAction func accountTypeValueChanged(_ sender: UISegmentedControl) {
        isMentor = !isMentor
        print(isMentor)
    }
    
    @IBAction func pageToggleTapped(_ sender: UIButton) {
        
        if isSignUp == false {
            UIView.animate(withDuration: 0.2 ) {
                self.toggleToSignUp()
                self.isSignUp = true
            }
        } else {
            UIView.animate(withDuration: 0.2 ) {
                self.toggleToLogin()
                self.isSignUp = false
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
        toggleToSignUp()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEmailVerify" {
            guard let email = emailTextField.text,
                let destinationVC = segue.destination as? EmailVerifyViewController
            else {return}
            destinationVC.email = email
            destinationVC.isMentor = isMentor
        }
    }
    
} // End Of Class
