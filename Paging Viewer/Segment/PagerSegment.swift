//
//  PagerSegment.swift
//  PagingView
//
//  Created by Indrajit Chavda on 24/03/22.
//

import UIKit

class PagerSegment: UIView {
    
    var items: [PagerSegmentItem]? {
        didSet {
            collectionView.reloadData()
            selectionBar.setWidth(width: UIScreen.main.bounds.width / CGFloat(items?.count ?? 1))
        }
    }
    
    let attribute: SegmentAttribute
    var pagerViewCollectionReference: UICollectionView?
    
    var xAxisOfSelectionBar: NSLayoutConstraint?
    
    lazy var collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = attribute.spacing
        layout.minimumLineSpacing = 0
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero,
                                  collectionViewLayout: self.collectionLayout)
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(PagerSegmentCell.self,
                    forCellWithReuseIdentifier: PagerSegmentCell.cellId)
        return cv
    }()
    
    lazy var selectionBar: UIView = {
        let view = UIView()
        view.backgroundColor = self.attribute.selectionBarColor
        view.layer.masksToBounds = true
        view.layer.cornerRadius = self.attribute.selectionBarCornerRadius
        return view
    }()
    
    init(attributes: SegmentAttribute) {
        
        self.attribute = attributes
        super.init(frame: .zero)
        self.backgroundColor = attributes.backgroundColor
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        self.addSubview(collectionView)
        collectionView.setFullOnSuperView(withSpacing: attribute.padding)
        if self.attribute.showSelectionBar {
            self.addSubview(selectionBar)
            selectionBar.setHeight(height: attribute.heightOfSelectionBar)
            selectionBar.setBottom(with: self.bottomAnchor, constant: 0)
            xAxisOfSelectionBar = selectionBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0)
            xAxisOfSelectionBar?.isActive = true
        }
    }
    
    func selectedCellAt(indexPath: IndexPath, scrollPager: Bool) {
        let _items = self.items
        let referenceCollectionCellsCount = self.pagerViewCollectionReference?.numberOfItems(inSection: 0) ?? 0
        
        if indexPath.item < referenceCollectionCellsCount {
            
            _items?.forEach({ $0.isSelected = false })
            _items?[indexPath.item].isSelected = true
            self.items = _items
            
            if scrollPager {
                self.pagerViewCollectionReference?.selectItem(at: indexPath,
                                                              animated: true,
                                                              scrollPosition: .centeredHorizontally)
            }
            
            if attribute.showSelectionBar {
                let oneCellSize: CGFloat = UIScreen.main.bounds.width / CGFloat((items?.count ?? 1))
                self.xAxisOfSelectionBar?.constant = oneCellSize * CGFloat(indexPath.item)
            }
        } else {
            print("No cell found for the index item", indexPath.item, "Did you provide the corresponding cell ?")
        }
    }
}
