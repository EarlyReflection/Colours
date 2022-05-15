//
//  StartViewController.swift
//  DvornikovVA_HW_2.2_Colours
//
//  Created by Vladimir Dvornikov on 10.05.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewColor(from color: UIColor )
}

class StartViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVS = segue.destination as? SettingsViewController else { return }
        settingsVS.colourOfSettingsVC = view.backgroundColor
        settingsVS.delegate = self
    }
}

extension StartViewController: SettingsViewControllerDelegate {
    func setNewColor(from color: UIColor) {
        view.backgroundColor = color
    }
}
