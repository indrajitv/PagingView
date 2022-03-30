//
//  PagerViewCollectionCell.swift
//  PagingView
//
//  Created by Indrajit Chavda on 24/03/22.
//

import UIKit

protocol PagerViewCellDelegate: UICollectionViewCell {
    var cellId: String { get }
    func willDisplayCell(indexPath: IndexPath)
}

extension PagerViewCellDelegate {
    var cellId: String {
        return String(describing: self)
    }
}
