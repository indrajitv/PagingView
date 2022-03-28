//
//  ViewController.swift
//  PagingView
//
//  Created by Indrajit Chavda on 24/03/22.
//

import UIKit


class ViewController: UIViewController {
  
    let segment: PagerSegment = {
        let segment = PagerSegment(attributes: SegmentAttribute())
        segment.items = [
            .init(title: "Item 1", id: "item_1", textColor: (selected: .darkGray, unSelected: .darkGray), backgroundColor: (selected: .red, unSelected: .lightGray), fonts: (selected: .systemFont(ofSize: 14, weight: .bold), unSelected: .systemFont(ofSize: 14, weight: .regular)), isSelected: true),
            
                .init(title: "Item 2", id: "item_2", textColor: (selected: .darkGray, unSelected: .darkGray), backgroundColor: (selected: .red, unSelected: .lightGray), fonts: (selected: .systemFont(ofSize: 14, weight: .bold), unSelected: .systemFont(ofSize: 14, weight: .regular)), isSelected: false),
            
                .init(title: "Item 3", id: "item_2", textColor: (selected: .darkGray, unSelected: .darkGray), backgroundColor: (selected: .red, unSelected: .lightGray), fonts: (selected: .systemFont(ofSize: 14, weight: .bold), unSelected: .systemFont(ofSize: 14, weight: .regular)), isSelected: false),
            
                .init(title: "Item 4", id: "item_2", textColor: (selected: .darkGray, unSelected: .darkGray), backgroundColor: (selected: .red, unSelected: .lightGray), fonts: (selected: .systemFont(ofSize: 14, weight: .bold), unSelected: .systemFont(ofSize: 14, weight: .regular)), isSelected: false),
            
                .init(title: "Item 5", id: "item_2", textColor: (selected: .darkGray, unSelected: .darkGray), backgroundColor: (selected: .red, unSelected: .lightGray), fonts: (selected: .systemFont(ofSize: 14, weight: .bold), unSelected: .systemFont(ofSize: 14, weight: .regular)), isSelected: false)
        ]
        return segment
    }()
    lazy var pagerView = PagerView(attributes: .init(backgroundColor: .systemRed),
                                   pagerSegment: self.segment)
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.addSubview(pagerView)
        pagerView.setFullOnSuperView()
        
        let firstCell = Cell1()
        self.pagerView.cells = [firstCell, Cell1(),  Cell1(), Cell1(), Cell1(), Cell1()]
    }

}

class Cell1: UICollectionViewCell, PagerViewCellDelegate {
   override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .random
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
