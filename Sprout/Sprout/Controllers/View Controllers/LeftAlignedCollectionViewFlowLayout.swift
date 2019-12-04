//
//  LeftAlignedCollectionViewFlowLayout.swift
//  Sprout
//
//  Created by Zebadiah Watson on 12/4/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributesObjects = super.layoutAttributesForElements(in: rect)
        layoutAttributesObjects?.forEach({ (layoutAttribute) in
            if layoutAttribute.representedElementCategory == .cell {
                let indexPath = layoutAttribute.indexPath
                if let newFrame = layoutAttributesForItem(at: indexPath)?.frame {
                    layoutAttribute.frame = newFrame
                }
            }
        })
        return layoutAttributesObjects
    }
}
