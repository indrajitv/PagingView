//
//  File.swift
//  PagingView
//
//  Created by Indrajit Chavda on 27/03/22.
//

import UIKit

extension PagerSegment: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        selectedCellAt(indexPath: indexPath, scrollPager: true)
    }
    
}

extension PagerSegment: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PagerSegmentCell.cellId,
                                                      for: indexPath) as! PagerSegmentCell
        cell.item = items?[indexPath.item]
        return cell
    }
    
}

extension PagerSegment: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if attribute.sizeOfItem == .equalSpacing {
            let count = items?.count ?? 1
            let width: CGFloat = self.frame.width / CGFloat(count)
            return .init(width: width, height: self.frame.height)
        } else {
            let width: CGFloat = items?[indexPath.item].getWidthOfSegment() ?? 50
            return .init(width: width, height: self.frame.height)
        }
    }
    
}

