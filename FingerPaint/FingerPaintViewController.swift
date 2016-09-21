//
//  ViewController.swift
//  FingerPaint
//
//  Created by Nolan Lapham on 9/19/16.
//  Copyright © 2016 Intrepid Pursuits. All rights reserved.
//

import UIKit

final class FingerPaintViewController: UIViewController {
    
// MARK: - Outlets, Variables and Models

    let drawingVM = DrawingViewModel()
    
    let colorChosen = ColorsToChooseFrom()
    
    @IBOutlet weak var imageView: UIImageView!
    

    @IBOutlet var opacityButtons: [UIButton]!
    @IBOutlet var paintBrushWidthButtons: [UIButton]!
    @IBOutlet var colorButtons: [UIButton]!
    
    @IBOutlet weak var opacityButton: UIButton!
    @IBOutlet weak var widthButton: UIButton!
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var eraserButton: UIButton!
    @IBOutlet weak var eraseButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!

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
    
    @IBAction func saveButton(_ sender: UIButton) {
        
        if let image = imageView.image {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
    
    // MARK: - Line Drawing Code
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        
        // 1
        UIGraphicsBeginImageContext(view.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            imageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
            
            drawingVM.drawLineForContext(context: context, fromPoint: fromPoint, toPoint: toPoint)
            
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
    
// MARK: - ViewController LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        drawingVM.setupForViewDidLoad(withPaintBrushColorButtons: colorButtons, andWithOpacityButtons: opacityButtons, andPaintBrushWidthButtons: paintBrushWidthButtons)
    }
    
// MARK: - Animations
    
    override func viewDidAppear(_ animated: Bool) {
        
        var multiplierForWidthCircles: CGFloat = 0.15
        for button in paintBrushWidthButtons {
            button.imageEdgeInsets = UIEdgeInsetsMake(multiplierForWidthCircles * button.frame.size.height / 2, multiplierForWidthCircles * button.frame.size.width / 2, multiplierForWidthCircles * button.frame.size.height / 2, multiplierForWidthCircles * button.frame.size.width / 2)
            multiplierForWidthCircles += 0.15
        }
        
        saveButton.center.y += view.bounds.height
        opacityButton.center.x -= view.bounds.width
        widthButton.center.x -= view.bounds.width
        colorButton.center.x -= view.bounds.width
        eraserButton.center.x -= view.bounds.width
        eraseButton.center.x -= view.bounds.width

        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       options: .curveEaseOut,
                       animations: { [weak self] in
                        guard let strongSelf = self else { return }
                        strongSelf.eraseButton.center.x += strongSelf.view.bounds.width
                        strongSelf.saveButton.center.y -= strongSelf.view.bounds.height
                        },
                       completion: nil)
        
        UIView.animate(withDuration: 1.0,
                       delay: 0.2,
                       options: .curveEaseOut,
                       animations: { [weak self] in
                        guard let strongSelf = self else { return }
                        strongSelf.eraserButton.center.x += strongSelf.view.bounds.width
                        },
                       completion: nil)
        
        
        UIView.animate(withDuration: 1.0,
                       delay: 0.4,
                       options: .curveEaseOut,
                       animations: { [weak self] in
                        guard let strongSelf = self else { return }
                        strongSelf.colorButton.center.x += strongSelf.view.bounds.width
                        },
                       completion: nil)
        
        UIView.animate(withDuration: 1.0,
                       delay: 0.6,
                       options: .curveEaseOut,
                       animations: { [weak self] in
                        guard let strongSelf = self else { return }
                        strongSelf.widthButton.center.x += strongSelf.view.bounds.width
                        },
                       completion: nil)
        
        UIView.animate(withDuration: 1.0,
                       delay: 0.8,
                       options: .curveEaseOut,
                       animations: { [weak self] in
                        guard let strongSelf = self else { return }
                        strongSelf.opacityButton.center.x += strongSelf.view.bounds.width
                        },
                       completion: nil)
    }

}
