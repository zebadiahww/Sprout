//
//  LoginVerifyEmailViewController.swift
//  Sprout
//
//  Created by Travis Wheeler on 12/9/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class LoginVerifyEmailViewController: UIViewController {
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var resendEmailButton: UIButton!
    @IBOutlet weak var actionLabel: UILabel!
    
    var isMentor: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionLabel.isHidden = true
        actionLabel.alpha = 0
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        UserController.shared.checkEmailVerification { (success) in
            if success {
//                self.performSegue(withIdentifier: "toHome", sender: sender)
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
                self.actionLabel.text = "Verifiation e-mail has been sent"
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
        if segue.identifier == "toHome" {
            guard let isMentor = isMentor else {return}
            //let destinationVC = segue.destination as?
                //HomeViewController
            //destinationVC.isMentor = isMentor
        }
    }
}
