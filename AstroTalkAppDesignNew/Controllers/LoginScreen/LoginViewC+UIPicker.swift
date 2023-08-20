//
//  LoginViewC+UIPicker.swift
//  AstroTalkAppDesignNew
//
//  Created by Jogender Singh on 11/08/23.
//

import Foundation
import UIKit

// MARK: - PICKER DATASOURCE AND DELEGATE
extension LoginViewC: UIPickerViewDataSource, UIPickerViewDelegate {
    
    // TODO: NUMBER OF COMPONENTS
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    // TODO: NUMBER OF ROWS IN COMPONENT
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.countries?.count ?? 0
    }

   
    // TODO: TITILE FOR ROW
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  self.countries?[row].combinedValueFull
    }

    // TODO: DID SELECT ROW
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      //  self.textFieldCountryCode.text = self.titles[row]
    }
}

// MARK: - PICKER DATASOURCE AND DELEGATE
extension LoginViewC: ToolbarPickerViewDelegate {
    // TODO: DID TAP DONE
    func didTapDone() {
        let row = self.pickerView.selectedRow(inComponent: 0)
        self.pickerView.selectRow(row, inComponent: 0, animated: false)
        self.textFieldCountryCode.text = self.countries?[row].combinedValue
        self.countryCode = self.countries?[row].dial_code ?? String()
        self.textFieldCountryCode.resignFirstResponder()
    }

    // TODO: DID CANCEL
    func didTapCancel() {
        self.textFieldCountryCode.text = nil
        self.textFieldCountryCode.resignFirstResponder()
    }
}
