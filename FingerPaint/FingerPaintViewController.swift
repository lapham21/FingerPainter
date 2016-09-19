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
    
    @IBOutlet var opacitiyButtons: [UIButton]!
    @IBOutlet var paintBrushWidthButtons: [UIButton]!

    @IBAction func showOptions(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            displayButtons(buttons: opacitiyButtons, withShouldShowBoolean: &opacityButtonsShown)
()
        case 1:
            displayButtons(buttons: paintBrushWidthButtons, withShouldShowBoolean: &paintBrushWidthButtonsShown)
        default: break
        }
        
    }
    
    // TODO: - Change the opacity and width of drawline when buttons hit
    @IBAction func opacityChangeButtons(_ sender: UIButton) {
        switch sender.tag {
        case 0: break
        case 1: break
        case 2: break
        case 3: break
        case 4: break
        case 5: break
        default: break
        }
    }
    @IBAction func paintBrushWidthChangeButtons(_ sender: UIButton) {
        switch sender.tag {
        case 0: break
        case 1: break
        case 2: break
        case 3: break
        case 4: break
        case 5: break
        default: break
        }
    }
    
    
    @IBAction func eraseButton(_ sender: UIButton) {
        
    }
    
    
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

