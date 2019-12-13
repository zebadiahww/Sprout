//
//  ForeignTagCollectionViewCell.swift
//  Sprout
//
//  Created by Marcus Armstrong on 12/12/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class ForeignTagCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tagNameLabel: UILabel!
    
    func updateLabel(title:String) {
        tagNameLabel.text = title
    }
    
}
