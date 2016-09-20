//
//  DrawingView.swift
//  FingerPaint
//
//  Created by Nolan Lapham on 9/20/16.
//  Copyright © 2016 Intrepid Pursuits. All rights reserved.
//

import Foundation
import UIKit

class DrawingViewModel {
    
    var isDrawing = false
    var color = UIColor.black.cgColor
    var lastPoint: CGPoint = CGPoint.zero
    var currentPoint: CGPoint = CGPoint.zero
    var opacity: CGFloat = 1.0
    var paintBrushWidth: CGFloat = 5.0
    let paintBrushWidthConverter: CGFloat = 5.0
    
    var red = UIColor.init(red: 0.91, green: 0.30, blue: 0.24, alpha: 1.0).cgColor
    var orange = UIColor.init(red: 0.90, green: 0.49, blue: 0.13, alpha: 1.0).cgColor
    var yellow = UIColor.init(red: 0.95, green: 0.77, blue: 0.06, alpha: 1.0).cgColor
    var green = UIColor.init(red: 0.18, green: 0.80, blue: 0.44, alpha: 1.0).cgColor
    var blue = UIColor.init(red: 0.20, green: 0.60, blue: 0.86, alpha: 1.0).cgColor
    var black = UIColor.black.cgColor
    var white = UIColor.white.cgColor
    
    
    func displayButtons(buttons: [UIButton], withShouldShowBoolean shouldShow: inout Bool) {
        for button in buttons {
            button.isHidden = !shouldShow
        }
        shouldShow = !shouldShow
    }
    
    func changeDisplayButtonsColors(imageForColorCircle: UIImage, opacityButtons: [UIButton], paintBrushWidthButtons: [UIButton]) {
        for button in opacityButtons {
            button.setImage(imageForColorCircle, for: .normal)
        }
        for button in paintBrushWidthButtons {
            button.setImage(imageForColorCircle, for: .normal)
        }
    }

}
