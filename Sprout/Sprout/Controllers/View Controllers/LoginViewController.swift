//
//  LoginViewController.swift
//  Sprout
//
//  Created by Zebadiah Watson on 11/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

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
    
    
    // MARK: - Actions
    @IBAction func loginButtonTapped(_ sender: Any) {
    }
    
    
    @IBAction func accountTypeButtonTapped(_ sender: Any) {
    }
    
    
    

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
