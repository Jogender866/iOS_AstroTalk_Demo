//
//  OTPViewController+CustomMethods.swift
//  AstroTalkAppDesignNew
//
//  Created by Jogender Singh on 17/08/23.
//

import Foundation
import UIKit


// MARK: - USER DEFINED METHODS
extension OTPViewController{
    // TODO: INITIAL SETUP
    internal func initialSetup(){
        print("IN OTPViewController...!")
        self.labelTitle.text = "\(AppText.shared.OTPSentTo) \(self.countryCode)-\(self.phoneNumber)"
        self.labelResendOTPTitle.text = "\(AppText.shared.resendOTPAvailableIn) \(self.timerCount) \(AppText.shared.s)"
        
        // Setting progress
        self.setupOTPViewUI()
        self.start_Timer60SecResendOTP()
        self.setupCircularUI()
    }
    
    // TODO: SET CIRCULAR BAR UI
    internal func setupCircularUI(){
        
        self.progressRing.setProgress(0, animated: true)
        
        /// Set track color
        /// If you don't need a gradient, just set the same values for `startColor` and `endColor`
        self.progressRing.startColor = UIColor(named: AppText.shared.K_Green) ?? .green
        self.progressRing.endColor = UIColor(named: AppText.shared.K_GrayLight) ?? .lightGray

        /// Set groove color
        self.progressRing.grooveColor = UIColor(named: AppText.shared.K_GrayLight) ?? .lightGray
        
        self.progressRing.startAngle = -.pi / 2 // The start angle of the ring to begin drawing.
        self.progressRing.endAngle = 1.5 * .pi // The end angle of the ring to end drawing.
        self.progressRing.startGradientPoint = .init(x: 0.5, y: 0) // The starting poin of the gradient
        self.progressRing.endGradientPoint = .init(x: 0.5, y: 1) // The ending position of the gradient.

        // Sets the line width for progress ring and "groove" ring
        self.progressRing.lineWidth = 4
        // Or, if you need to separate these parameters, use
        self.progressRing.ringWidth = 4
        self.progressRing.grooveWidth = 4
        self.progressRing.timingFunction = .easeOutExpo // Timing function of the ring's fill animation
        
        
    }
    
    
    
    // TODO: INVALIDATE TIMER<timer60SecResendOTP>
    internal func invalidate_Timer60SecResendOTP(){
        self.timer60SecResendOTP?.invalidate()
        self.timer60SecResendOTP = nil
    }
    
   
    
    // TODO: START TIMER<timer60SecResendOTP>
    internal func start_Timer60SecResendOTP(){
        self.invalidate_Timer60SecResendOTP()
        self.timer60SecResendOTP = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer_Timer60SecResendOTP), userInfo: nil, repeats: true)
    }
    
    // TODO: SETUP OTP VIEW
    internal func setupOTPViewUI(){
        self.otpView.otpFieldsCount = 6
        self.otpView.otpFieldDefaultBorderColor = #colorLiteral(red: 0.3176470588, green: 0.3176470588, blue: 0.3176470588, alpha: 1)
        self.otpView.otpFieldEnteredBorderColor = #colorLiteral(red: 0.3098039216, green: 0.6078431373, blue: 0.4196078431, alpha: 1)
        self.otpView.otpFieldErrorBorderColor = #colorLiteral(red: 0.5803921569, green: 0.06666666667, blue: 0, alpha: 1)
        self.otpView.otpFieldBorderWidth = 1
        self.otpView.delegate = self
        self.otpView.shouldAllowIntermediateEditing = false
        self.otpView.otpFieldSize = 40
        self.otpView.layer.cornerRadius = 5
        self.otpView.otpFieldDisplayType = .square
        self.otpView.cursorColor = #colorLiteral(red: 0.3176470588, green: 0.3176470588, blue: 0.3176470588, alpha: 1)

        // Create the UI
        self.otpView.initializeUI()
    }
    
    
    // TODO: NAVIGATION SETUP
    internal func navigationSetup(animated:Bool){
        self.navigationController?.setNavigationBarHidden(false, animated: !animated)
        self.title = AppText.shared.verifyPhone
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: GlobalMethods.shared.headerFont()]
        
        let backButton = GlobalMethods.shared.addBackButton()
        self.navigationItem.leftBarButtonItems = [backButton]
        
        GlobalMethods.shared.callBackPop = { [weak self] in
            guard let self = self else {return}
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    
    
    
}



