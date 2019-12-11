//
//  MentorPupilListTableViewController.swift
//  Sprout
//
//  Created by Travis Wheeler on 12/9/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class MentorPupilListTableViewController: UITableViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var mentorImage: UIImageView!
    @IBOutlet weak var mentorLabel: UILabel!
    @IBOutlet weak var myPupilsLabel: UILabel!
    @IBOutlet weak var numberOfPupilsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pupilCell", for: indexPath)

        // Configure the cell...

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    //MARK: - Class Methods
    func setUpViews() {
        self.mentorImage.layer.cornerRadius = mentorImage.frame.height/2
        self.mentorLabel.layer.cornerRadius = mentorLabel.frame.height/6
    }
    
    func fetchMentorData() {
        // need mentor's profile image, the amount of pupils he has, and the maximum amount of pupils that the mentor can take on.
    }
    
} // End of Class
