//
//  ViewController.swift
//  TolstiyHw1
//
//  Created by Матвей on 24.07.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    let valueForPickerView = Array(0...1000) // так и не смог поставить значение до бесконечности в методах в extension
    
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var pickerView: UIPickerView!
    @IBOutlet private weak var stepper: UIStepper!
    @IBOutlet private weak var switchOutlet: UISwitch! // не даёт присвоить просто "switch"
    
    var pickerViewValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        stepperValue()
    }
    
    private  func stepperValue() {
        stepper.value = 0
        stepper.minimumValue = 0
        stepper.maximumValue = 1000
    }
    
    private func hideAllElements() {
        textView.isHidden = true
        stepper.isHidden = true
        pickerView.isHidden = true
        
    }
    
    @IBAction private func pickerValueChanged(_ sender: UIStepper) {
        let value = Int(sender.value)
        
        if value > 500 {
            sender.isEnabled = false
        } else {
            pickerViewValue = value
            sender.isEnabled = true
            pickerView.selectRow(pickerViewValue, inComponent: 0, animated: true)
        }
            
            if pickerViewValue % 2 == 0 {
                switchOutlet.isEnabled = true
                hideAllElements()
            } else {
                switchOutlet.isEnabled = false
            }
        
    }
    
    
    @IBAction private func switchPressed(_ sender: UISwitch) {
        textView.isHidden = !textView.isHidden
        pickerView.isHidden = !pickerView.isHidden
        stepper.isHidden = !stepper.isHidden
    }
}



extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return valueForPickerView.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(valueForPickerView[row])"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if stepper.value > 500 {
            stepper.isEnabled = false
        } else {
            stepper.value = Double(row)
            pickerViewValue = Int(stepper.value)
            stepper.isEnabled = true
            pickerView.selectRow(pickerViewValue, inComponent: 0, animated: true)
        }
        
        if pickerViewValue % 2 == 0 {
            switchOutlet.isEnabled = true
            hideAllElements()
        } else {
            switchOutlet.isEnabled = false
        }
        pickerViewValue = row // // переписал сюда условие из степпера, чтобы при прокрутке барабана срабатывало то же условие что и при изменении значения на степпере
    }
}

