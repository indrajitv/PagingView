//
//  PagerSegmentCell.swift
//  PagingView
//
//  Created by Indrajit Chavda on 27/03/22.
//

import UIKit

class PagerSegmentCell: UICollectionViewCell {
    static let cellId: String = String(describing: self)
    
    let labelTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    var item: PagerSegmentItem? {
        didSet {
            configureCell()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(labelTitle)
        labelTitle.setFullOnSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        backgroundColor = nil
        labelTitle.textColor = nil
        labelTitle.font = nil
        labelTitle.text = nil
    }
    
    func configureCell() {
        guard let item = self.item else {
            return
        }
        
        backgroundColor = item.getBackground()
        labelTitle.textColor = item.getTextColor()
        labelTitle.font = item.getFonts()
        labelTitle.text = item.title
    }
}

