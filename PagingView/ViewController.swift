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
            
                .init(title: "Item 5", id: "item_2", textColor: (selected: .darkGray, unSelected: .darkGray), backgroundColor: (selected: .red, unSelected: .lightGray), fonts: (selected: .systemFont(ofSize: 14, weight: .bold), unSelected: .systemFont(ofSize: 14, weight: .regular)), isSelected: false),
            
                .init(title: "Item 6", id: "item_2", textColor: (selected: .darkGray, unSelected: .darkGray), backgroundColor: (selected: .red, unSelected: .lightGray), fonts: (selected: .systemFont(ofSize: 14, weight: .bold), unSelected: .systemFont(ofSize: 14, weight: .regular)), isSelected: false)
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
     
        self.pagerView.cells = [CellForViewCotnroller1.self, CellForViewCotnroller2.self]
    }
    
}

class FirstVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .random
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        callAPI()
    }
    
    func callAPI() {
        
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

class CellForViewCotnroller1: UICollectionViewCell, PagerViewCellDelegate {
    let viewCotnroller1 = FirstVC()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        print("created", self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
      
        if self.viewCotnroller1.view.superview == nil {
            self.addSubviews(views: [self.viewCotnroller1.view])
            self.viewCotnroller1.view.setFullOnSuperView(withSpacing: 50)
        }
    }
    
    func willDisplayCell(indexPath: IndexPath) {
        viewCotnroller1.viewWillAppear(false)
    }
    
}



class CellForViewCotnroller2: UICollectionViewCell, PagerViewCellDelegate {
    let viewCotnroller1 = FirstVC()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        print("created", self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if self.viewCotnroller1.view.superview == nil {
            self.addSubviews(views: [self.viewCotnroller1.view])
            self.viewCotnroller1.view.setFullOnSuperView(withSpacing: 50)
        }
    }
    
    func willDisplayCell(indexPath: IndexPath) {
        viewCotnroller1.viewWillAppear(false)
    }
    
}

