//
//  ViewController.swift
//  DvornikovVA_HW_2.2_Colours
//
//  Created by Vladimir Dvornikov on 31.03.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    var colourOfSettingsVC: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        setSlider()
        setColor()
       
        
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
    }
    
    @IBAction func sliderAddingRed() {
        setValue(for: redValueLabel)
        setColor()
    }
    
    @IBAction func sliderAddingGreen() {
        setValue(for: greenValueLabel)
        setColor()
    }
    
    @IBAction func sliderAddingBlue() {
        setValue(for: blueValueLabel)
        setColor()
    }
    
    @IBAction func DonePressed() {
        guard let backgroundColor = colorView.backgroundColor else { return }
        delegate.setNewColor(from: backgroundColor)
        dismiss(animated: true)
    }
    
    private func setSlider() {
        let convertedColor = CIColor(color: colourOfSettingsVC)
        redSlider.value = Float(convertedColor.red)
        greenSlider.value = Float(convertedColor.green)
        blueSlider.value = Float(convertedColor.blue)
        
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redValueLabel:
                redValueLabel.text = string(from: redSlider)
            case greenValueLabel:
                greenValueLabel.text = string(from: greenSlider)
            default:
                blueValueLabel.text = string(from: blueSlider)
            }
        }
    
    }
    
    private func string(from slider: UISlider) -> String {
        String(format:"%0.2f", slider.value)
    }
}




