//
//  AppPickerTextField.swift
//  MyApp
//
//  Created by HuyTNH on 02/12/2023.
//  Copyright © 2023 com.thehuytong. All rights reserved.
//

import UIKit

final class AppPickerTextField: AppTextField {
    private let pickerView = UIPickerView()
    
    var items: [String] = [] {
        didSet {
            pickerView.reloadAllComponents()
        }
    }
    
    override func setupUI() {
        super.setupUI()
        pickerView.delegate = self
        pickerView.dataSource = self
        inputView = pickerView
        allowsEditingTextAttributes = false
        delegate = self
        autocorrectionType = .no
    }
    
    override func shouldChangeText(in range: UITextRange, replacementText text: String) -> Bool {
        return false
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
    
}

extension AppPickerTextField: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
}

extension AppPickerTextField: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        text = items[row]
    }
}

extension AppPickerTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if text?.isEmpty ?? true {
            pickerView.selectRow(0, inComponent: 0, animated: false)
            pickerView(pickerView, didSelectRow: 0, inComponent: 0)
        }
    }
}
 
