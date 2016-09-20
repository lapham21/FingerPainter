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
    var colorButtonsShown = false
    var tempBool = false

    let drawingVM = DrawingViewModel()
    
    let colorChosen = ColorsToChooseFrom()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet var opacitiyButtons: [UIButton]!
    @IBOutlet var paintBrushWidthButtons: [UIButton]!
    @IBOutlet var colorButtons: [UIButton]!

    @IBAction func showOptions(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            drawingVM.displayButtons(buttons: opacitiyButtons, withShouldShowBoolean: &opacityButtonsShown)
            
            tempBool = !paintBrushWidthButtonsShown
            drawingVM.displayButtons(buttons: paintBrushWidthButtons, withShouldShowBoolean: &tempBool)
            tempBool = !colorButtonsShown
            drawingVM.displayButtons(buttons: colorButtons, withShouldShowBoolean: &tempBool)
        case 1:
            drawingVM.displayButtons(buttons: paintBrushWidthButtons, withShouldShowBoolean: &paintBrushWidthButtonsShown)
            
            tempBool = !opacityButtonsShown
            drawingVM.displayButtons(buttons: opacitiyButtons, withShouldShowBoolean: &tempBool)
            tempBool = !colorButtonsShown
            drawingVM.displayButtons(buttons: colorButtons, withShouldShowBoolean: &tempBool)
        case 2:
            drawingVM.displayButtons(buttons: colorButtons, withShouldShowBoolean: &colorButtonsShown)
            
            tempBool = !paintBrushWidthButtonsShown
            drawingVM.displayButtons(buttons: paintBrushWidthButtons, withShouldShowBoolean: &tempBool)
            tempBool = !opacityButtonsShown
            drawingVM.displayButtons(buttons: opacitiyButtons, withShouldShowBoolean: &tempBool)
        default: break
        }
        
    }
    
    @IBAction func opacityChangeButtons(_ sender: UIButton) {
        switch sender.tag {
        case 0: drawingVM.opacity = 1.0
                drawingVM.displayButtons(buttons: opacitiyButtons, withShouldShowBoolean: &opacityButtonsShown)
        case 1: drawingVM.opacity = 0.75
                drawingVM.displayButtons(buttons: opacitiyButtons, withShouldShowBoolean: &opacityButtonsShown)
        case 2: drawingVM.opacity = 0.60
                drawingVM.displayButtons(buttons: opacitiyButtons, withShouldShowBoolean: &opacityButtonsShown)
        case 3: drawingVM.opacity = 0.45
                drawingVM.displayButtons(buttons: opacitiyButtons, withShouldShowBoolean: &opacityButtonsShown)
        case 4: drawingVM.opacity = 0.30
                drawingVM.displayButtons(buttons: opacitiyButtons, withShouldShowBoolean: &opacityButtonsShown)
        case 5: drawingVM.opacity = 0.15
                drawingVM.displayButtons(buttons: opacitiyButtons, withShouldShowBoolean: &opacityButtonsShown)
        default: break
        }
    }
    
    @IBAction func paintBrushWidthChangeButtons(_ sender: UIButton) {
        switch sender.tag {
        case 0: drawingVM.paintBrushWidth = 1.0 * drawingVM.paintBrushWidthConverter
                drawingVM.displayButtons(buttons: paintBrushWidthButtons, withShouldShowBoolean: &paintBrushWidthButtonsShown)
        case 1: drawingVM.paintBrushWidth = 0.75 * drawingVM.paintBrushWidthConverter
                drawingVM.displayButtons(buttons: paintBrushWidthButtons, withShouldShowBoolean: &paintBrushWidthButtonsShown)
        case 2: drawingVM.paintBrushWidth = 0.60 * drawingVM.paintBrushWidthConverter
                drawingVM.displayButtons(buttons: paintBrushWidthButtons, withShouldShowBoolean: &paintBrushWidthButtonsShown)
        case 3: drawingVM.paintBrushWidth = 0.45 * drawingVM.paintBrushWidthConverter
                drawingVM.displayButtons(buttons: paintBrushWidthButtons, withShouldShowBoolean: &paintBrushWidthButtonsShown)
        case 4: drawingVM.paintBrushWidth = 0.30 * drawingVM.paintBrushWidthConverter
                drawingVM.displayButtons(buttons: paintBrushWidthButtons, withShouldShowBoolean: &paintBrushWidthButtonsShown)
        case 5: drawingVM.paintBrushWidth = 0.15 * drawingVM.paintBrushWidthConverter
                drawingVM.displayButtons(buttons: paintBrushWidthButtons, withShouldShowBoolean: &paintBrushWidthButtonsShown)
        default: break
        }
    }
    
    @IBAction func paintColorChangeButtons(_ sender: UIButton) {
        switch sender.tag {
        case 0: drawingVM.color = drawingVM.black
        drawingVM.displayButtons(buttons: colorButtons, withShouldShowBoolean: &colorButtonsShown)
        drawingVM.changeDisplayButtonsColors(imageForColorCircle: #imageLiteral(resourceName: "CircleForOpacityLevelButtons"), opacityButtons: opacitiyButtons, paintBrushWidthButtons: paintBrushWidthButtons)
        case 1: drawingVM.color = drawingVM.blue
        drawingVM.displayButtons(buttons: colorButtons, withShouldShowBoolean: &colorButtonsShown)
        drawingVM.changeDisplayButtonsColors(imageForColorCircle: #imageLiteral(resourceName: "blueCircle"), opacityButtons: opacitiyButtons, paintBrushWidthButtons: paintBrushWidthButtons)
        case 2: drawingVM.color = drawingVM.green
        drawingVM.displayButtons(buttons: colorButtons, withShouldShowBoolean: &colorButtonsShown)
        drawingVM.changeDisplayButtonsColors(imageForColorCircle: #imageLiteral(resourceName: "greenCircle"), opacityButtons: opacitiyButtons, paintBrushWidthButtons: paintBrushWidthButtons)
        case 3: drawingVM.color = drawingVM.red
        drawingVM.displayButtons(buttons: colorButtons, withShouldShowBoolean: &colorButtonsShown)
        drawingVM.changeDisplayButtonsColors(imageForColorCircle: #imageLiteral(resourceName: "redCircle"), opacityButtons: opacitiyButtons, paintBrushWidthButtons: paintBrushWidthButtons)
        case 4: drawingVM.color = drawingVM.orange
        drawingVM.displayButtons(buttons: colorButtons, withShouldShowBoolean: &colorButtonsShown)
        drawingVM.changeDisplayButtonsColors(imageForColorCircle: #imageLiteral(resourceName: "orangeCircle"), opacityButtons: opacitiyButtons, paintBrushWidthButtons: paintBrushWidthButtons)
        case 5: drawingVM.color = drawingVM.yellow
        drawingVM.displayButtons(buttons: colorButtons, withShouldShowBoolean: &colorButtonsShown)
        drawingVM.changeDisplayButtonsColors(imageForColorCircle: #imageLiteral(resourceName: "yellowCircle"), opacityButtons: opacitiyButtons, paintBrushWidthButtons: paintBrushWidthButtons)
        default: break
        }
    }
    
    @IBAction func eraserButton(_ sender: AnyObject) {
        drawingVM.color = drawingVM.white
    }
    
    @IBAction func eraseButton(_ sender: UIButton) {
        imageView.image = nil
    }
    
    // MARK: - ViewController LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        drawingVM.displayButtons(buttons: opacitiyButtons, withShouldShowBoolean: &opacityButtonsShown)
        drawingVM.displayButtons(buttons: paintBrushWidthButtons, withShouldShowBoolean: &paintBrushWidthButtonsShown)
        drawingVM.displayButtons(buttons: colorButtons, withShouldShowBoolean: &colorButtonsShown)
    }
    
}

// MARK: - Line Drawing Code

extension FingerPaintViewController {
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        
        // 1
        UIGraphicsBeginImageContext(view.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            imageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
            
            // 2
            context.move(to: fromPoint)
            context.addLine(to: toPoint)
            
            // 3
            context.setLineWidth(drawingVM.paintBrushWidth)
            context.setStrokeColor(drawingVM.color)
            context.setAlpha(drawingVM.opacity)
            
            // 4
            context.strokePath()
            
            // 5
            imageView.image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        drawingVM.isDrawing = false
        if let touch = touches.first {
            drawingVM.lastPoint = touch.location(in: self.view)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        drawingVM.isDrawing = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: view)
            drawLineFrom(fromPoint: drawingVM.lastPoint, toPoint: currentPoint)
            
            drawingVM.lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if !drawingVM.isDrawing {
            drawLineFrom(fromPoint: drawingVM.lastPoint, toPoint: drawingVM.lastPoint)
        }
        
    }

}
