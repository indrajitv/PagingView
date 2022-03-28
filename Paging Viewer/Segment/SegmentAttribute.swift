//
//  File.swift
//  PagingView
//
//  Created by Indrajit Chavda on 27/03/22.
//

import UIKit

enum PagerSegmentSize {
    case equalSpacing
    case fontSize
}

struct SegmentAttribute {
    var showSelectionBar: Bool = true
    var segmentHeight: CGFloat = 50
    var backgroundColor: UIColor = .white
    var padding: CGFloat = 0
    var spacing: CGFloat = 0
    var sizeOfItem: PagerSegmentSize = .equalSpacing
    
    var selectionBarColor: UIColor = .systemBlue
    var selectionBarCornerRadius: CGFloat = 2
    var heightOfSelectionBar: CGFloat = 5
}
