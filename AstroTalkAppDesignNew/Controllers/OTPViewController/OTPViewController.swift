//
//  OTPViewController.swift
//  AstroTalkAppDesignNew
//
//  Created by Jogender Singh on 14/08/23.
//

import UIKit
import Firebase
import FirebaseAuth

class OTPViewController: UIViewController {
    // MARK: - IBOUTLETS
    @IBOutlet weak var otpView: VPMOTPView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelResendOTPTitle: UILabel!
    @IBOutlet weak var viewResendOTPButtonContainer: UIView!
    @IBOutlet weak var progressRing: ALProgressRing!
    
    
    // MARK: - PROPERTIES
    internal var countryCode:String = String()
    internal var phoneNumber:String = String()
    internal var timer60SecResendOTP:Timer?
    internal var timerCount:Int = 60
    internal var enteredOtp: String = String()

    
    // MARK: - VIEW LIFE CYCLE METHODS
    // TODO: VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    // TODO: VIEW WILL APPEAR
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationSetup(animated: animated)
    }
    
    // TODO: VIEW WILL DISAPPEAR
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.invalidate_Timer60SecResendOTP()
    }
    
    
    // TODO: DEINIT
    deinit{
        print("ViewController DEINIT...!")
    }
    
    // MARK: - ACTIONS
    // TODO: BUTTON RESEND OTP TAPPED
    @IBAction func buttonResend_OTP_Tapped(_ sender: UIButton) {
        self.viewResendOTPButtonContainer.isHidden = true
        self.progressRing.isHidden = false
        self.timerCount = 60
        self.labelResendOTPTitle.text = "\(AppText.shared.resendOTPAvailableIn) \(self.timerCount) \(AppText.shared.s)"
        self.start_Timer60SecResendOTP()
    }
    
    // MARK: - SELECTORS
    // TODO: FIRE TIMER<timer60SecResendOTP>
    @objc func fireTimer_Timer60SecResendOTP() {
        if self.timerCount > 1{
            self.timerCount -= 1
            self.viewResendOTPButtonContainer.isHidden = true
            self.progressRing.isHidden = false
            self.labelResendOTPTitle.text = "\(AppText.shared.resendOTPAvailableIn) \(self.timerCount) \(AppText.shared.s)"
            
            let progress:Float = Float(self.progressRing.progress + (1.0/60.0))
            self.progressRing.setProgress(progress, animated: true)
            
        }else{
            self.invalidate_Timer60SecResendOTP()
            self.viewResendOTPButtonContainer.isHidden = false
            self.progressRing.isHidden = true
            self.labelResendOTPTitle.text = "\(AppText.shared.resendOTPAvailable)"
            self.progressRing.setProgress(0, animated: true)
            
        }
    }
    
   
}
