//
//  CustomControl.swift
//  Stars
//
//  Created by Ian French on 5/28/20.
//  Copyright © 2020 Ian French. All rights reserved.
//

import UIKit

@IBDesignable class CustomControl: UIControl {
    
    var value: Int = 1
    var labels: [UILabel] = []
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: Int = 5
    private let componentColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setUpViews()
    }
    
    func setUpViews() {
        
        var count: CGFloat = 0.0
        
        
        for rank in 1...5 {
            let spacing: CGFloat = (componentDimension * count + 8.0 * count)
            let starLabel: UILabel = UILabel(frame: CGRect(x: spacing , y: 0, width: componentDimension, height: componentDimension))
            
            starLabel.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(starLabel)
            
            starLabel.font = UIFont.systemFont(ofSize: 32.0, weight: .bold)
            starLabel.text = ":star2:"
            
            starLabel.textColor = componentInactiveColor
            
            starLabel.tag = rank
            labels.append(starLabel)
            
            
            count += 1.0
            
            NSLog("\(starLabel)")
            
        }
            
            
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
  // Touch handler functions
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
