//
//  ViewController.swift
//  DvornikovVA_HW_2.2_Colours
//
//  Created by Vladimir Dvornikov on 31.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colourView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colourView.layer.cornerRadius = 10
        setColor()
    }
    
    @IBAction func sliderAddingRed() {
        redValueLabel.text = string(from: redSlider)
        setColor()
    }
    
    @IBAction func sliderAddingGreen() {
        greenValueLabel.text = string(from: greenSlider)
        setColor()
    }
    
    @IBAction func sliderAddingBlue() {
        blueValueLabel.text = string(from: blueSlider)
        setColor()
    }
    
    private func setColor() {
        colourView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format:"%0.2f", slider.value)
    }
}




