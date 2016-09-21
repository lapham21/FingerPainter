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

    let drawingVM = DrawingViewModel()
    
    let colorChosen = ColorsToChooseFrom()
    
    @IBOutlet weak var imageView: UIImageView!
    

    @IBOutlet var opacityButtons: [UIButton]!
    @IBOutlet var paintBrushWidthButtons: [UIButton]!
    @IBOutlet var colorButtons: [UIButton]!

    @IBAction func showOptions(_ sender: UIButton) {
        
        drawingVM.showOptions(sender: sender, opacityButtons: opacityButtons, colorButtons: colorButtons, paintBrushWidthButtons: paintBrushWidthButtons)
        
    }
    
    @IBAction func opacityChangeButtons(_ sender: UIButton) {
        drawingVM.changeOpacityBasedOn(button: sender, withOpacityButtons: opacityButtons)
    }
    
    @IBAction func paintBrushWidthChangeButtons(_ sender: UIButton) {
        drawingVM.changePaintBrushWidthBasedOn(button: sender, withPaintBrushWidthButtons: paintBrushWidthButtons)
    }
    
    @IBAction func paintColorChangeButtons(_ sender: UIButton) {
        drawingVM.changePaintBrushColorBasedOn(button: sender, withPaintBrushColorButtons: colorButtons, andWithOpacityButtons: opacityButtons, andPaintBrushWidthButtons: paintBrushWidthButtons)
    }
    
    @IBAction func eraserButton(_ sender: AnyObject) {
        drawingVM.eraser()
    }
    
    @IBAction func eraseButton(_ sender: UIButton) {
        imageView.image = nil
    }
    
    // MARK: - ViewController LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        drawingVM.setupForViewDidLoad(withPaintBrushColorButtons: colorButtons, andWithOpacityButtons: opacityButtons, andPaintBrushWidthButtons: paintBrushWidthButtons)
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
