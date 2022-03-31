//
//  PagerView+Extension.swift
//  PagingView
//
//  Created by Indrajit Chavda on 24/03/22.
//

import UIKit

extension PagerView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? PagerViewCellDelegate {
            cell.willDisplayCell(indexPath: indexPath)
        }
     }
}

extension PagerView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let type = self.cells[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: type.cellId, for: indexPath)
        return cell
    }
}

extension PagerView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.attributes.pagerCellSize ?? .init(width: collectionView.frame.width,
                                                      height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        if width != 0 {
            let indexPath: IndexPath = .init(row: Int(offSet + horizontalCenter) / Int(width), section: 0)
            self.pagerSegment?.selectedCellAt(indexPath: indexPath, scrollPager: false)
        }
    }
}
