//
//  ViewController.swift
//  TolstiyHW
//
//  Created by Матвей on 17.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.isHidden = true
        
        label.font = label.font.withSize(20)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .purple
        
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 0.5
        
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        
        label.isHidden = false
        enum displayStatus {
            case showDataFromTextField
            case showDataFromSlider
            case showDataFromDatePicker
        }
        
        var currentStatus = displayStatus.showDataFromTextField
        
        func chechStatus() {
            if currentStatus == .showDataFromTextField {
                currentStatus = .showDataFromSlider
            } else if currentStatus == .showDataFromSlider {
               currentStatus = .showDataFromDatePicker
            } else if currentStatus == .showDataFromDatePicker {
               currentStatus = .showDataFromTextField
            }
            
        }
        
        
            switch currentStatus {
            case .showDataFromTextField:
                textField.text = "Привет, толстый"
                label.text = textField.text
                
            case .showDataFromSlider:
                label.text = String(slider.value)
                
            case .showDataFromDatePicker:
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .full
                let dateValue = dateFormatter.string(from: datePicker.date)
                label.text = dateValue
                
                
            }
        
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        label.text = String(slider.value)
            
    }
    
    @IBAction func changeDate(_ sender: UIDatePicker) {
        label.numberOfLines = 2
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        let dateValue = dateFormatter.string(from: datePicker.date)
        return label.text = dateValue
    }
}

