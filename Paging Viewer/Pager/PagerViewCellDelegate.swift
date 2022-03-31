//
//  PagerViewCollectionCell.swift
//  PagingView
//
//  Created by Indrajit Chavda on 24/03/22.
//

import UIKit

protocol PagerViewCellDelegate: UICollectionViewCell {
    static var cellId: String { get }
    func willDisplayCell(indexPath: IndexPath)
}

extension PagerViewCellDelegate {
    static var cellId: String {
        return String(describing: self)
    }
}
