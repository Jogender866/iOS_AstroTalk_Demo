//
//  Validations.swift
//  AstroTalkAppDesignNew
//
//  Created by Jogender Singh on 14/08/23.
//

import Foundation
class Validations{
    // TODO: SINGLETON OBJECT
    static let shared:Validations = Validations()
    private init(){}
    
    // TODO: CHECK EMPTY STRING
    internal func isEmpty(text:String) -> Bool{
        if text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            return true
        }
        return false
    }
    
    
    // TODO: IS VALID PHONE
    internal func isValidPhone(phone: String) -> Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return !phoneTest.evaluate(with: phone)
    }
    
}
