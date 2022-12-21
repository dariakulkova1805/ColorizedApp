//
//  ViewController.swift
//  ColorizedApp
//
//  Created by DARYA on 12/14/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var canvasForBackground: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeColor()
    }
    
    @IBAction func ColorSliderAction(_ sender: UISlider) {
        changeColor()
        
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func changeColor() {
        canvasForBackground.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}


    
    

