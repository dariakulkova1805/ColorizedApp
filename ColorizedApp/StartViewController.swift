//
//  StartViewController.swift
//  ColorizedApp
//
//  Created by DARYA on 5/16/23.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setColor(_ color: UIColor)
}

class StartViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorVC = segue.destination as? SettingsViewController else { return }
        colorVC.delegate = self
        colorVC.colorView = view.backgroundColor
    }
}

extension StartViewController: SettingsViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
