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
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    


    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }


    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setUpViews()
    }
    
    func setUpViews() {
        

        
        
        for rank in 1...5 {




            let starLabel = UILabel()
            starLabel.tag = rank
            labels.append(starLabel)

         
            addSubview(starLabel)
            
            starLabel.font = UIFont.systemFont(ofSize: 32.0, weight: .bold)
            starLabel.text = "⭐"
            starLabel.textAlignment = .center

            if rank == 1 {
                starLabel.textColor = componentActiveColor
            } else {
            starLabel.textColor = componentInactiveColor
            }

             let spacing = CGFloat(8.0 * CGFloat(rank))
              starLabel.frame = CGRect(x: spacing + (componentDimension * CGFloat(rank - 1)), y: 0, width: componentDimension, height: componentDimension)

            
            NSLog("\(starLabel)")
            
        }
            
            
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    
    func updateValue(at touch: UITouch) {
        for label in labels {
            let touchPoint = touch.location(in: label)
            if label.bounds.contains(touchPoint) {
                value = label.tag
                label.textColor = componentActiveColor
                sendActions(for: .valueChanged)
                label.pulseStar()

                for number in 1...label.tag {
                    let label = labels.filter { $0.tag == number}.first
                    if let label = label {
                        label.textColor = componentActiveColor
                    }
                }
            } else {
                    label.textColor = componentInactiveColor }

                }
            }

    
    
    
  // Touch handler functions
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
       updateValue(at: touch)
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .valueChanged])
            updateValue(at: touch)
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    
    
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer {
            super.endTracking(touch, with: event)
        }
        
        guard let touch = touch else {return}
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
           updateValue(at: touch)
            sendActions(for: [.touchUpInside, .valueChanged])
         
              } else {
                  sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
           sendActions(for: [.touchCancel])
         
    
    
 
    
    
  }
    
    
    
    
    
}

extension UIView {
    
    func pulseStar() {
        
        func pulse() { transform = CGAffineTransform(scaleX: 2.0, y: 2.0)}
        
        func revert() { transform = .identity}
   
        UIView.animate(withDuration: 0.2,
                       animations: {pulse() },
                       
                       completion: { _ in UIView.animate(withDuration: 0.2) {revert()}}
     )
    }
    
}

   

