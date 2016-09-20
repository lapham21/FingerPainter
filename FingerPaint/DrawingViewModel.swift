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
    var lastPoint: CGPoint = CGPoint.zero
    var currentPoint: CGPoint = CGPoint.zero
    var opacity: CGFloat = 1.0
    var paintBrushWidth: CGFloat = 5.0
    let paintBrushWidthConverter: CGFloat = 5.0
    
    
    func displayButtons(buttons: [UIButton], withShouldShowBoolean shouldShow: inout Bool) {
        for button in buttons {
            button.isHidden = !shouldShow
        }
        shouldShow = !shouldShow
    }

}
