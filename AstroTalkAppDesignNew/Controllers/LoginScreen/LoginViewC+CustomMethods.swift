//
//  LoginViewC+CustomMethods.swift
//  AstroTalkAppDesignNew
//
//  Created by Jogender Singh on 11/08/23.
//

import Foundation
import UIKit

// MARK: - USER DEFINED METHODS
extension LoginViewC{
    // TODO: INITIAL SETUP
    internal func initialSetup(){
        print("IN LoginViewC...!")
        self.setUISkipButton()
        
        self.setUITermAndPrivacyLabel()
        
        self.setUIBottomLabel(info: "100%", s_text: AppText.shared.privacy, label: self.labelPrivacy)
        self.setUIBottomLabel(info: "10000+", s_text: AppText.shared.topAstrologerOf, label: self.labelTopAstrologers)
        self.setUIBottomLabel(info: "3Cr+", s_text: AppText.shared.happyCustomers, label: self.labelHappy)
        
        
        self.manageKeyboard()
        
        self.getCountries()
        
    }
    
    // TODO: NAVIGATION SETUP
    internal func navigationSetup(animated:Bool){
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    
    
    // TODO: SETUP SKIP BUTTON
    internal func setUISkipButton(){
        let myAttributedString:NSMutableAttributedString = NSMutableAttributedString()
        myAttributedString.append(NSAttributedString(string: AppText.shared.skipText, attributes: [ NSAttributedString.Key.foregroundColor: UIColor(named: AppText.shared.k_Black) ?? .black ,NSAttributedString.Key.font:UIFont(name: AppText.shared.poppinsRegular, size: 15.0) ?? .systemFont(ofSize: 15.0),NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]))
        self.buttonSkipRef.setAttributedTitle(myAttributedString, for: .normal)
    }
    
    // TODO: SETUP TERMS AND CONDITION LABEL
    internal func setUITermAndPrivacyLabel(){
        let myAttributedString:NSMutableAttributedString = NSMutableAttributedString()
        
        myAttributedString.append(NSAttributedString(string: AppText.shared.bySigningUp, attributes: [ NSAttributedString.Key.foregroundColor: UIColor(named: AppText.shared.k_GrayGreenMix) ?? .black ,NSAttributedString.Key.font:UIFont(name: AppText.shared.poppinsRegular, size: 13.0) ?? .systemFont(ofSize: 13.0)]))
        
        myAttributedString.append(NSAttributedString(string: AppText.shared.termOfUse, attributes: [ NSAttributedString.Key.foregroundColor: UIColor(named: AppText.shared.k_BlueTint) ?? .black ,NSAttributedString.Key.font:UIFont(name: AppText.shared.poppinsRegular, size: 13.0) ?? .systemFont(ofSize: 13.0),NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]))
        
        myAttributedString.append(NSAttributedString(string: AppText.shared.and, attributes: [ NSAttributedString.Key.foregroundColor: UIColor(named: AppText.shared.k_GrayGreenMix) ?? .black ,NSAttributedString.Key.font:UIFont(name: AppText.shared.poppinsRegular, size: 13.0) ?? .systemFont(ofSize: 13.0)]))
        
        myAttributedString.append(NSAttributedString(string: AppText.shared.privacyPolicy, attributes: [ NSAttributedString.Key.foregroundColor: UIColor(named: AppText.shared.k_BlueTint) ?? .black ,NSAttributedString.Key.font:UIFont(name: AppText.shared.poppinsRegular, size: 13.0) ?? .systemFont(ofSize: 13.0),NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]))
        
        self.labelTermsAndCondition.attributedText = myAttributedString
    }
    
    // TODO: SETUP BOTTOM LABELS
    internal func setUIBottomLabel(info:String,s_text:String,label:UILabel){
        let myAttributedString:NSMutableAttributedString = NSMutableAttributedString()
        
        myAttributedString.append(NSAttributedString(string: "\(info)\n", attributes: [ NSAttributedString.Key.foregroundColor: UIColor(named: AppText.shared.k_Black) ?? .black ,NSAttributedString.Key.font:UIFont(name: AppText.shared.poppinsMedium, size: 20.0) ?? .systemFont(ofSize: 20.0)]))
        
        myAttributedString.append(NSAttributedString(string: s_text, attributes: [ NSAttributedString.Key.foregroundColor: UIColor(named: AppText.shared.k_Black) ?? .black ,NSAttributedString.Key.font:UIFont(name: AppText.shared.poppinsLight, size: 13.0) ?? .systemFont(ofSize: 13.0)]))
        
        label.attributedText = myAttributedString
        
        print(label.frame.size.height)
    }
    
    
    // TODO: GET COUNTRIES
    internal func getCountries(){
        if let url = Bundle.main.url(forResource: "CountryCodes", withExtension: "json"){
            do{
                let data = try Data(contentsOf: url)
                let jsonData = try JSONDecoder().decode([CountryDataModel].self, from: data)
                self.countries = jsonData
                self.setupPickerController()
            } catch {
                print("error:\(error)")
            }
        }
        
    }
    
    
    // TODO: SETUP COUNTRY CODE PICKER
    internal func setupPickerController(){
        self.textFieldCountryCode.inputView = self.pickerView
        self.textFieldCountryCode.inputAccessoryView = self.pickerView.toolbar
        
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.pickerView.toolbarDelegate = self
        
        self.pickerView.reloadAllComponents()
    }
    
    
    // TODO: CANCEL KEYBOARD WHEN CLICK OUTSIDE
    internal func manageKeyboard(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    
    // TODO: VALIDATE FIELDS
    internal func validateFields()->String{
        if Validations.shared.isEmpty(text: self.countryCode.trimmingCharacters(in: .whitespacesAndNewlines)){
            return AppText.shared.selectCountryCode
        }
        
        if Validations.shared.isEmpty(text: self.textFieldPhoneNumber.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? String()){
            return AppText.shared.enterPhoneNumber
        }
        
       /* if Validations.shared.isValidPhone(phone: self.textFieldPhoneNumber.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? String()){
            return AppText.shared.enterValidPhoneNumber
        } */
        return String()
    }
    
    
    
    
    
}
