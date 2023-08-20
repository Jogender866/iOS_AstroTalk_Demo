//
//  CountryDataModel.swift
//  CakeAnyTime
//
//  Created by Aman Kumar on 24/05/22.
//

import Foundation


struct CountryDataModel:Codable,Hashable{
    var code : String
    var dial_code : String
    var name : String
}

// MARK: - EXTENSION FUNCTIONS
extension CountryDataModel{
    var flag:String{
        let base : UInt32 = 127397
        var flag = String()
        for v in self.code.unicodeScalars {
            if let unicodeScalar = UnicodeScalar(base + v.value){
                flag.unicodeScalars.append(unicodeScalar)
            }
        }
        return flag
    }
}


extension CountryDataModel{
    var combinedValue:String{
        return "\(flag) \(code) \(dial_code)"
    }
    
    var combinedValueFull:String{
        return "\(flag) \(name) \(dial_code)"
    }
    
    
}


