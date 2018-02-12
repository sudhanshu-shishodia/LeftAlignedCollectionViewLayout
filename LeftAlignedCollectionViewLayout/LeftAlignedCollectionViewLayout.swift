//
//  LeftAlignedCollectionViewLayout.swift
//  LeftAlignedCollectionViewLayout
//
//  Created by Sudhanshu Singh on 2/12/18.
//  Copyright © 2018 self. All rights reserved.
//

import UIKit


extension UICollectionViewLayoutAttributes {
    
    func setLeftAlignedFrame(withEdgeInsets edgeInsets: UIEdgeInsets) {
        var frame: CGRect = self.frame
        frame.origin.x = edgeInsets.left
        self.frame = frame
    }
}



class LeftAlignedCollectionViewLayout: UICollectionViewFlowLayout {
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let defaultAttributes = super.layoutAttributesForElements(in: rect)
        var newAttributes: [UICollectionViewLayoutAttributes]? = defaultAttributes
        
        for index in 0..<defaultAttributes!.count {
            newAttributes?[index] = self.layoutAttributesForItem(at: defaultAttributes![index].indexPath)!
        }
        
        return newAttributes
    }
    
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        let currentAttributes: UICollectionViewLayoutAttributes? = super.layoutAttributesForItem(at: indexPath)
        let layoutWidth = collectionView!.frame.width - sectionInset.left - sectionInset.right
        
        if indexPath.item == 0 {
            currentAttributes?.setLeftAlignedFrame(withEdgeInsets: sectionInset)
            return currentAttributes
        }
        
        let lastIndexPath = IndexPath(item: indexPath.item - 1, section: indexPath.section)
        var lastFrameMaxX: CGFloat = 0.0
        var lastFrame = CGRect.zero
        if let previousFrame = layoutAttributesForItem(at: lastIndexPath)?.frame {
            lastFrame = previousFrame
            lastFrameMaxX = previousFrame.origin.x + previousFrame.size.width
        }
        
        var currentFrameMax = CGRect.zero
        if let currentFrame = currentAttributes?.frame {
            currentFrameMax = CGRect(x: sectionInset.left, y: currentFrame.origin.y, width: layoutWidth, height: currentFrame.size.height)
        }
        
        if !lastFrame.intersects(currentFrameMax) {
            currentAttributes?.setLeftAlignedFrame(withEdgeInsets: sectionInset)
            return currentAttributes
        }
        
        if var frame = currentAttributes?.frame {
            frame.origin.x = lastFrameMaxX + minimumInteritemSpacing
            currentAttributes?.frame = frame
        }
        
        return currentAttributes
    }
}
