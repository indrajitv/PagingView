//
//  PagerSegmentItem.swift
//  PagingView
//
//  Created by Indrajit Chavda on 27/03/22.
//

import UIKit

class PagerSegmentItem {
 
    let title, id: String
    let textColor: (selected: UIColor, unSelected: UIColor)
    let backgroundColor: (selected: UIColor, unSelected: UIColor)
    let fonts: (selected: UIFont, unSelected: UIFont)
    
    var isSelected: Bool = false
    
    init(title: String,
         id: String,
         textColor: (selected: UIColor, unSelected: UIColor),
         backgroundColor: (selected: UIColor, unSelected: UIColor),
         fonts: (selected: UIFont, unSelected: UIFont),
         isSelected: Bool = false) {
        self.title = title
        self.id = id
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.fonts = fonts
        self.isSelected = isSelected
    }
    
    func getBackground() -> UIColor {
        return isSelected ? backgroundColor.selected : backgroundColor.unSelected
    }
    
    func getTextColor() -> UIColor {
        return isSelected ? textColor.selected : textColor.unSelected
    }
    
    func getFonts() -> UIFont {
        return isSelected ? fonts.selected : fonts.unSelected
    }
    
    func getWidthOfSegment() -> CGFloat {
        let calculatedWidth: CGFloat = title.estimatedFrame(font: self.getFonts()).width + 40
        return calculatedWidth
    }
}
