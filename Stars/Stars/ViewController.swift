//
//  ViewController.swift
//  Stars
//
//  Created by Ian French on 5/28/20.
//  Copyright © 2020 Ian French. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
        
        let N = ratingControl.value
        
        switch N {
        case 1:
            self.title = "User Rating: \(N) star."
        default:
            self.title = "User Rating: \(N) stars."
        }
    }
    


}

