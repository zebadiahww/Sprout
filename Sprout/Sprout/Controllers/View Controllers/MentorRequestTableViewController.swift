//
//  MentorRequestTableViewController.swift
//  Sprout
//
//  Created by Travis Wheeler on 12/9/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class MentorRequestTableViewController: UITableViewController {

    //MARK: - Outlets
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pupilRequest", for: indexPath)

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
//    func setupViews() {
//        self.pupilProfileImage.layer.cornerRadius = pupilProfileImage.frame.height/2
//    }
    
} // End of Class
