//
//  MentorProfileViewController.swift
//  Sprout
//
//  Created by Zebadiah Watson on 11/27/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class MentorProfileViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var profilePictureImageView: UIImageView!
    
    @IBOutlet weak var requestMentorLabel: UILabel!
    @IBOutlet weak var sendMesageLabel: UILabel!
    @IBOutlet weak var addContactLabel: UILabel!
    @IBOutlet weak var connectSocialMediaLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var pupilsLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    
    @IBOutlet weak var requestMentorButton: UIButton!
    @IBOutlet weak var sendMessagButton: UIButton!
    @IBOutlet weak var addContactButton: UIButton!
    @IBOutlet weak var connectSocialMediaButton: UIButton!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    //MARK: - Actions
    @IBAction func requestMentorButtonTapped(_ sender: Any) {
    }
    @IBAction func sendMessageButtonTapped(_ sender: Any) {
    }
    @IBAction func addContactButtonTapped(_ sender: Any) {
    }
    @IBAction func connectSocialMediaButtonTapped(_ sender: Any) {
    }
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
