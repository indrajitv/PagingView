//
//  PagerView.swift
//  PagingView
//
//  Created by Indrajit Chavda on 24/03/22.
//

import UIKit

class PagerView: UIView {
    
    let attributes: PagerViewAttribute
    var pagerSegment: PagerSegment?
     
    var cells: [PagerViewCellDelegate] = [] {
        didSet {
            self.cells.forEach({
                self.collectionView.register($0.classForCoder.self,
                                             forCellWithReuseIdentifier: $0.cellId)
            })
            collectionView.reloadData()
        }
    }
    
   
    let collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
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
        cv.isPagingEnabled = self.attributes.isPagingEnabledForCollection
        return cv
    }()
    
    init(attributes: PagerViewAttribute, pagerSegment: PagerSegment?) {

        self.attributes = attributes
        self.pagerSegment = pagerSegment
        super.init(frame: .zero)
        
        setUpViews()
        self.pagerSegment?.pagerViewCollectionReference = self.collectionView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
      
        backgroundColor = self.attributes.backgroundColor
        self.addSubviews(views: [collectionView])
       
        if let pagerSegment = pagerSegment {
            self.addSubviews(views: [pagerSegment])
            
            pagerSegment.setHeight(height: pagerSegment.attribute.segmentHeight)
            pagerSegment.setAnchors(top: self.topAnchor,
                                    leading: self.leadingAnchor,
                                    trailing: self.trailingAnchor)
            
            collectionView.setAnchors(top: pagerSegment.bottomAnchor,
                                      bottom: self.bottomAnchor,
                                      leading: self.leadingAnchor,
                                      trailing: self.trailingAnchor)
        } else {
            collectionView.setAnchors(top: self.topAnchor,
                                      bottom: self.bottomAnchor,
                                      leading: self.leadingAnchor,
                                      trailing: self.trailingAnchor)
            
        }
    }
}
