//
//  EmailVerifyViewController.swift
//  Sprout
//
//  Created by Marcus Armstrong on 12/3/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class EmailVerifyViewController: UIViewController {

    var isMentor: Bool?
    var email: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProfileCreation" {
            guard let email = email,
                let isMentor = isMentor else {return}
            let destinationVC = segue.destination as? CreateProfileTableViewController
            destinationVC?.isMentor = isMentor
        }
    }

}
