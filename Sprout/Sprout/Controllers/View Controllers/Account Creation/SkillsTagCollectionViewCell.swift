//
//  SkillsTagCollectionViewCell.swift
//  Sprout
//
//  Created by Zebadiah Watson on 12/4/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

protocol deleteButtonTappedDelegate {
    func reloadOnDeletion()
}

class SkillsTagCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var skillTagLabel: UILabel!
    @IBOutlet weak var deleteTagButton: UIButton!
    
    //MARK: - Properties
    var currentTag: Tag?
    var delegate: deleteButtonTappedDelegate?
    
    
    
    
    func deleteTag(tag: Tag) {
        guard let index = TagsController.shared.tags.firstIndex(of: tag) else { return }
        if tag.userIDs?.count == 0 || tag.userIDs == nil {
            TagsController.shared.deleteTag(tag: tag, index: index)
        } else {
            TagsController.shared.tags.remove(at: index)
        }
    }

    
    
    //MARK: - Actions
    @IBAction func deleteTagButtonTapped(_ sender: Any) {
        guard let currentTag = currentTag else { return }
        deleteTag(tag: currentTag)
        delegate?.reloadOnDeletion()
    }
    
}
