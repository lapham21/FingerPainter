//
//  ViewController.swift
//  FingerPaint
//
//  Created by Nolan Lapham on 9/19/16.
//  Copyright © 2016 Intrepid Pursuits. All rights reserved.
//

import UIKit

class FingerPaintViewController: UIViewController {
    
    // MARK: - Outlets, Variables and Models
    
    var opacityButtonsShown = false
    var paintBrushWidthButtonsShown = false
    var opacity: CGFloat = 1.0
    var paintBrushWidth: CGFloat = 10.0
    var paintBrushWidthConverter: CGFloat = 10.0
    
    @IBOutlet var opacitiyButtons: [UIButton]!
    @IBOutlet var paintBrushWidthButtons: [UIButton]!

    @IBAction func showOptions(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            displayButtons(buttons: opacitiyButtons, withShouldShowBoolean: &opacityButtonsShown)
        case 1:
            displayButtons(buttons: paintBrushWidthButtons, withShouldShowBoolean: &paintBrushWidthButtonsShown)
        default: break
        }
        
    }
    
    // TODO: - Change the opacity and width of drawline when buttons hit
    @IBAction func opacityChangeButtons(_ sender: UIButton) {
        switch sender.tag {
        case 0: opacity = 0.15
        case 1: opacity = 0.3
        case 2: opacity = 0.45
        case 3: opacity = 0.6
        case 4: opacity = 0.75
        case 5: opacity = 1.0
        default: break
        }
    }
    @IBAction func paintBrushWidthChangeButtons(_ sender: UIButton) {
        switch sender.tag {
        case 0: paintBrushWidth = 0.15 * paintBrushWidthConverter
        case 1: paintBrushWidth = 0.3 * paintBrushWidthConverter
        case 2: paintBrushWidth = 0.45 * paintBrushWidthConverter
        case 3: paintBrushWidth = 0.6 * paintBrushWidthConverter
        case 4: paintBrushWidth = 0.75 * paintBrushWidthConverter
        case 5: paintBrushWidth = 1.0 * paintBrushWidthConverter
        default: break
        }
    }
    
    
    @IBAction func eraseButton(_ sender: UIButton) {
        
    }
    
    // MARK: - Line Drawing Functionality
    
//    var lastPoint = CGPoint.zero

//    var swiped = false
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        swiped = false
//        if let touch = touches.first {
//            lastPoint = touch.location(in: self.view)
//        }
//    }
//    
//    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
//        
//        // 1
//        UIGraphicsBeginImageContext(view.frame.size)
//        let context = UIGraphicsGetCurrentContext()
//        tempImageView.image?.drawInRect(CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
//        
//        // 2
//        CGContextMoveToPoint(context, fromPoint.x, fromPoint.y)
//        CGContextAddLineToPoint(context, toPoint.x, toPoint.y)
//        
//        // 3
//        CGContextSetLineCap(context, kCGLineCapRound)
//        CGContextSetLineWidth(context, brushWidth)
//        CGContextSetRGBStrokeColor(context, red, green, blue, 1.0)
//        CGContextSetBlendMode(context, kCGBlendModeNormal)
//        
//        // 4
//        CGContextStrokePath(context)
//        
//        // 5
//        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
//        tempImageView.alpha = opacity
//        UIGraphicsEndImageContext()
//        
//    }
//    
//    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
//        // 6
//        swiped = true
//        if let touch = touches.first as? UITouch {
//            let currentPoint = touch.locationInView(view)
//            drawLineFrom(lastPoint, toPoint: currentPoint)
//            
//            // 7
//            lastPoint = currentPoint
//        }
//    }
//    
//    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
//        
//        if !swiped {
//            // draw a single point
//            drawLineFrom(fromPoint: lastPoint, toPoint: lastPoint)
//        }
//        
//        // Merge tempImageView into mainImageView
//        UIGraphicsBeginImageContext(mainImageView.frame.size)
//        mainImageView.image?.drawInRect(CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: kCGBlendModeNormal, alpha: 1.0)
//        tempImageView.image?.drawInRect(CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: kCGBlendModeNormal, alpha: opacity)
//        mainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        
//        tempImageView.image = nil
//    }
    
    // MARK: - ViewController LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        displayButtons(buttons: opacitiyButtons, withShouldShowBoolean: &opacityButtonsShown)
        displayButtons(buttons: paintBrushWidthButtons, withShouldShowBoolean: &paintBrushWidthButtonsShown)

    }
    
    // MARK: - Utility Functions
    
    func displayButtons(buttons: [UIButton], withShouldShowBoolean shouldShow: inout Bool) {
        for button in buttons {
            button.isHidden = !shouldShow
        }
        shouldShow = !shouldShow
    }

    
}

