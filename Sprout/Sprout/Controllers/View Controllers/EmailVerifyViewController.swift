//
//  EmailVerifyViewController.swift
//  Sprout
//
//  Created by Marcus Armstrong on 12/3/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class EmailVerifyViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var resendEmailButton: UIButton!
    @IBOutlet weak var actionLabel: UILabel!
    
    
    
    
    //MARK: - Properties
    var isMentor: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionLabel.isHidden = true
        actionLabel.alpha = 0
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    @IBAction func continueButtonTapped(_ sender: Any) {
        UserController.shared.checkEmailVerification { (success) in
            if success {
                self.performSegue(withIdentifier: "toProfileCreation", sender: sender)
            } else {
                self.actionLabel.isHidden = false
                self.actionLabel.text = "Your e-mail has not been verified. Please check your spam folder just in case"
                UIView.animate(withDuration: 0.5, animations: {
                    self.actionLabel.alpha = 1
                }) { (success) in
                    print("successfully sent email")
                }
            }
        }
    }
    
    @IBAction func resendEmailButtonTapped(_ sender: Any) {
        UserController.shared.sendEmailVerification { (success) in
            if success {
                self.actionLabel.isHidden = false
                self.actionLabel.text = "Verification e-mail has been sent"
                UIView.animate(withDuration: 0.5, animations: {
                    self.actionLabel.alpha = 1
                }) { (success) in
                    print("successfully sent email")
                }
            }
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProfileCreation" {
            guard let isMentor = isMentor else {return}
            let destinationVC = segue.destination as? CreateProfileTableViewController
            destinationVC?.isMentor = isMentor
        }
    }
}
