//
//  ViewController.swift
//  ColorizedApp
//
//  Created by DARYA on 12/14/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    @IBOutlet var canvasForBackground: UIView!
    
    // MARK: - Public Properties
    var delegate: SettingsViewControllerDelegate!
    var colorView: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColor()
        setSliderValue()
        setLabelValue()
        setTextFieldValue()
        canvasForBackground.backgroundColor = colorView
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    // MARK: - IB Actions
    @IBAction func colorTransferButtonPressed() {
        delegate?.setColor(canvasForBackground.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    @IBAction func ColorSliderAction(_ sender: UISlider) {
        changeColor()
        setLabelValue()
        setTextFieldValue()
    }
    
    // MARK: - Private Methods
    private func setLabelValue() {
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func setTextFieldValue() {
        redTextField.text = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func setSliderValue() {
        let color = CIColor(color: colorView)
        redSlider.setValue(Float(color.red), animated: true)
        greenSlider.setValue(Float(color.green), animated: true)
        blueSlider.setValue(Float(color.blue), animated: true)
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

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = redTextField.text else { return }
        let value = Float(text) ?? 0.0
        switch textField {
        case redTextField:
            redSlider.setValue(value, animated: true)
        case greenTextField:
            greenSlider.setValue(value, animated: true)
        default:
            blueSlider.setValue(value, animated: true)
        }
        
        setLabelValue()
        changeColor()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboard = UIToolbar()
        keyboard.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: self,
            action: nil)
        
        let buttonDone = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(didTapDone)
        )
        keyboard.items = [flexibleSpace, buttonDone]
        
        textField.keyboardType = .decimalPad
        textField.inputAccessoryView = keyboard
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
}



    
    

