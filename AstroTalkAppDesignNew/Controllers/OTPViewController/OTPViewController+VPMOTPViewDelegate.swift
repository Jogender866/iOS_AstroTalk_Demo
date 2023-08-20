//
//  OTPViewController+VPMOTPViewDelegate.swift
//  AstroTalkAppDesignNew
//
//  Created by Jogender Singh on 17/08/23.
//

import Foundation
import UIKit

extension OTPViewController: VPMOTPViewDelegate {
    // TODO: HAS ENTERED ALL OTP
    func hasEnteredAllOTP(hasEntered: Bool) -> Bool {
        print("Has entered all OTP? \(hasEntered)")
        
        return enteredOtp == "123456"
    }
    
    // TODO: SHOULD BECOME FIRST RESPONDER FOR OTP
    func shouldBecomeFirstResponderForOTP(otpFieldIndex index: Int) -> Bool {
        return true
    }
    
    // TODO: ENTERED OTP
    func enteredOTP(otpString: String) {
        enteredOtp = otpString
        print("OTPString: \(otpString)")
    }
}
