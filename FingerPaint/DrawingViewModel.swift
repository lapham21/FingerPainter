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
    
    var opacityButtonsShown = false
    var paintBrushWidthButtonsShown = false
    var colorButtonsShown = false
    var tempBool = false
    
    let Color = ColorsToChooseFrom()
  
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
    
    func showOptions(sender: UIButton, opacityButtons: [UIButton], colorButtons: [UIButton], paintBrushWidthButtons: [UIButton]) {
        
        switch sender.tag {
        case 0:
            displayButtons(buttons: opacityButtons, withShouldShowBoolean: &opacityButtonsShown)
            
            tempBool = !paintBrushWidthButtonsShown
            displayButtons(buttons: paintBrushWidthButtons, withShouldShowBoolean: &tempBool)
            tempBool = !colorButtonsShown
            displayButtons(buttons: colorButtons, withShouldShowBoolean: &tempBool)
        case 1:
            displayButtons(buttons: paintBrushWidthButtons, withShouldShowBoolean: &paintBrushWidthButtonsShown)
            
            tempBool = !opacityButtonsShown
            displayButtons(buttons: opacityButtons, withShouldShowBoolean: &tempBool)
            tempBool = !colorButtonsShown
            displayButtons(buttons: colorButtons, withShouldShowBoolean: &tempBool)
        case 2:
            displayButtons(buttons: colorButtons, withShouldShowBoolean: &colorButtonsShown)
            
            tempBool = !paintBrushWidthButtonsShown
            displayButtons(buttons: paintBrushWidthButtons, withShouldShowBoolean: &tempBool)
            tempBool = !opacityButtonsShown
            displayButtons(buttons: opacityButtons, withShouldShowBoolean: &tempBool)
        default: break
        }
    }
    
    func changeOpacityBasedOn(button sender: UIButton, withOpacityButtons opacityButtons: [UIButton]) {
        
        switch sender.tag {
        case 0: opacity = 1.0
        displayButtons(buttons: opacityButtons, withShouldShowBoolean: &opacityButtonsShown)
        case 1: opacity = 0.75
        displayButtons(buttons: opacityButtons, withShouldShowBoolean: &opacityButtonsShown)
        case 2: opacity = 0.60
        displayButtons(buttons: opacityButtons, withShouldShowBoolean: &opacityButtonsShown)
        case 3: opacity = 0.45
        displayButtons(buttons: opacityButtons, withShouldShowBoolean: &opacityButtonsShown)
        case 4: opacity = 0.30
        displayButtons(buttons: opacityButtons, withShouldShowBoolean: &opacityButtonsShown)
        case 5: opacity = 0.15
        displayButtons(buttons: opacityButtons, withShouldShowBoolean: &opacityButtonsShown)
        default: break
        }
        
    }
    
    func changePaintBrushWidthBasedOn(button sender: UIButton, withPaintBrushWidthButtons buttons: [UIButton]) {
        
        switch sender.tag {
        case 0: paintBrushWidth = 1.0 * paintBrushWidthConverter
        displayButtons(buttons: buttons, withShouldShowBoolean: &paintBrushWidthButtonsShown)
        case 1: paintBrushWidth = 0.75 * paintBrushWidthConverter
        displayButtons(buttons: buttons, withShouldShowBoolean: &paintBrushWidthButtonsShown)
        case 2: paintBrushWidth = 0.60 * paintBrushWidthConverter
        displayButtons(buttons: buttons, withShouldShowBoolean: &paintBrushWidthButtonsShown)
        case 3: paintBrushWidth = 0.45 * paintBrushWidthConverter
        displayButtons(buttons: buttons, withShouldShowBoolean: &paintBrushWidthButtonsShown)
        case 4: paintBrushWidth = 0.30 * paintBrushWidthConverter
        displayButtons(buttons: buttons, withShouldShowBoolean: &paintBrushWidthButtonsShown)
        case 5: paintBrushWidth = 0.15 * paintBrushWidthConverter
        displayButtons(buttons: buttons, withShouldShowBoolean: &paintBrushWidthButtonsShown)
        default: break
        }
        
    }
    
    func changePaintBrushColorBasedOn(button sender: UIButton, withPaintBrushColorButtons colorButtons: [UIButton], andWithOpacityButtons opacityButtons: [UIButton], andPaintBrushWidthButtons paintBrushWidthButtons: [UIButton]) {
        
        switch sender.tag {
        case 0: color = Color.black
        displayButtons(buttons: colorButtons, withShouldShowBoolean: &colorButtonsShown)
        changeDisplayButtonsColors(imageForColorCircle: #imageLiteral(resourceName: "CircleForOpacityLevelButtons"), opacityButtons: opacityButtons, paintBrushWidthButtons: paintBrushWidthButtons)
        case 1: color = Color.blue
        displayButtons(buttons: colorButtons, withShouldShowBoolean: &colorButtonsShown)
        changeDisplayButtonsColors(imageForColorCircle: #imageLiteral(resourceName: "blueCircle"), opacityButtons: opacityButtons, paintBrushWidthButtons: paintBrushWidthButtons)
        case 2: color = Color.green
        displayButtons(buttons: colorButtons, withShouldShowBoolean: &colorButtonsShown)
        changeDisplayButtonsColors(imageForColorCircle: #imageLiteral(resourceName: "greenCircle"), opacityButtons: opacityButtons, paintBrushWidthButtons: paintBrushWidthButtons)
        case 3: color = Color.red
        displayButtons(buttons: colorButtons, withShouldShowBoolean: &colorButtonsShown)
        changeDisplayButtonsColors(imageForColorCircle: #imageLiteral(resourceName: "redCircle"), opacityButtons: opacityButtons, paintBrushWidthButtons: paintBrushWidthButtons)
        case 4: color = Color.orange
        displayButtons(buttons: colorButtons, withShouldShowBoolean: &colorButtonsShown)
        changeDisplayButtonsColors(imageForColorCircle: #imageLiteral(resourceName: "orangeCircle"), opacityButtons: opacityButtons, paintBrushWidthButtons: paintBrushWidthButtons)
        case 5: color = Color.yellow
        displayButtons(buttons: colorButtons, withShouldShowBoolean: &colorButtonsShown)
        changeDisplayButtonsColors(imageForColorCircle: #imageLiteral(resourceName: "yellowCircle"), opacityButtons: opacityButtons, paintBrushWidthButtons: paintBrushWidthButtons)
        default: break
        }
        
    }
    
    func eraser() {
        color = Color.white
    }
    
    func setupForViewDidLoad(withPaintBrushColorButtons colorButtons: [UIButton], andWithOpacityButtons opacityButtons: [UIButton], andPaintBrushWidthButtons paintBrushWidthButtons: [UIButton]) {
        
        displayButtons(buttons: opacityButtons, withShouldShowBoolean: &opacityButtonsShown)
        displayButtons(buttons: paintBrushWidthButtons, withShouldShowBoolean: &paintBrushWidthButtonsShown)
        displayButtons(buttons: colorButtons, withShouldShowBoolean: &colorButtonsShown)
        
    }

}
