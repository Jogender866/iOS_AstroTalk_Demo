//
//  LoginViewC.swift
//  AstroTalkAppDesignNew
//
//  Created by Jogender Singh on 11/08/23


import UIKit

class LoginViewC: UIViewController {
    // MARK: - IBOUTLETS
    @IBOutlet weak var buttonSkipRef: UIButton!
    @IBOutlet weak var labelTermsAndCondition: UILabel!
    @IBOutlet weak var labelPrivacy: UILabel!
    @IBOutlet weak var labelTopAstrologers: UILabel!
    @IBOutlet weak var labelHappy: UILabel!
    @IBOutlet weak var textFieldCountryCode: UITextField!
    @IBOutlet weak var textFieldPhoneNumber: UITextField!
    
    
    
    
    
    // MARK: - PROPERTIES
    internal let pickerView = ToolbarPickerView()
    internal var countries:[CountryDataModel]?
    internal var countryCode:String = String()
    
    
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
    
    // TODO: DEINIT
    deinit{
        print("LoginViewC DEINIT...!")
    }
    
    // MARK: - ACTIONS
    // TODO: BUTTON OTP SEND TAPPED
    @IBAction func buttonSend_OTP_Tapped(_ sender: Any) {
        if self.validateFields().isEmpty{
            print("SEND OTP...!")
            guard let vc = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "OTPViewController") as? OTPViewController else {return}
            vc.countryCode = self.countryCode
            vc.phoneNumber = self.textFieldPhoneNumber.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? String()
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            Alearts.shared.showAlertWithOkButton(view: self, title: AppText.shared.errorText, message: self.validateFields(), buttonTitle: AppText.shared.oKText) { [weak self] in
                guard self != nil else {return}
            }
        }
    }
    
    
    
    // MARK: - SELECTOR
    // TODO: DISMISS KEYBOARD METHOD
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
