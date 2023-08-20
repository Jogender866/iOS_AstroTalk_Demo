//
//  AppText.swift
//  AstroTalkAppDesignNew
//
//  Created by Jogender Singh on 11/08/23.
//

import Foundation
class AppText{
    // TODO: SINGLETON OBJECT
    static let shared:AppText = AppText()
    private init(){}
    
    // TODO: APP SPECIFIC
    internal let appName            :String           =       "Astrotalk"
    
    
    // TODO: FONT NAME
    internal let poppinsBlack       :String           =       "Poppins-Black"
    internal let poppinsBlackItalic :String           =       "Poppins-BlackItalic"
    internal let poppinsBold        :String           =       "Poppins-Bold"
    internal let poppinsBoldItalic  :String           =       "Poppins-BoldItalic"
    internal let poppinsExtraBold   :String           =       "Poppins-ExtraBold"
    internal let poppinsExtraBoldItalic :String       =       "Poppins-ExtraBoldItalic"
    internal let poppinsExtraLight  :String           =       "Poppins-ExtraLight"
    internal let poppinsExtraLightItalic :String      =       "Poppins-ExtraLightItalic"
    internal let poppinsItalic      :String           =       "Poppins-Italic"
    internal let poppinsLight       :String           =       "Poppins-Light"
    internal let poppinsLightItalic :String           =       "Poppins-LightItalic"
    internal let poppinsMedium      :String           =       "Poppins-Medium"
    internal let poppinsMediumItalic:String           =       "Poppins-MediumItalic"
    internal let poppinsRegular     :String           =       "Poppins-Regular"
    internal let poppinsSemiBold    :String           =       "Poppins-SemiBold"
    internal let poppinsSemiBoldItalic   :String      =       "Poppins-SemiBoldItalic"
    internal let poppinsThin        :String           =       "Poppins-Thin"
    internal let poppinsThinItalic  :String           =       "Poppins-ThinItalic"
    
    
    // TODO: COLOR NAME
    internal let k_PrimaryColor     :String           =       "K_PrimaryColor"
    internal let k_Black            :String           =       "K_Black"
    internal let k_GrayGreenMix     :String           =       "K_GrayGreenMix"
    internal let K_Green            :String           =       "K_Green"
    internal let K_Red              :String           =       "K_Red"
    internal let k_BlueTint         :String           =       "K_BlueTint"
    internal let k_Gray             :String           =       "K_Gray"
    internal let K_GrayLight        :String           =       "K_GrayLight"
    
    
    
    
    
    
    // TODO: TEXT
    internal let skipText     :String                 =       "Skip"
    internal let bySigningUp  :String                 =       "By signing up, you agree to our "
    internal let termOfUse    :String                 =       "Terms of Use"
    internal let and          :String                 =       " and "
    internal let privacyPolicy:String                 =       "Privacy Policy"
    internal let privacy      :String                 =       "Privacy"
    internal let topAstrologerOf:String               =       "Top astrologers of India"
    internal let happyCustomers :String               =       "Happy\ncustomers"
    
    internal let errorText      :String               =       "Error"
    internal let selectCountryCode:String             =       "Please select country code."
    internal let enterPhoneNumber :String             =       "Please enter phone number."
    internal let enterValidPhoneNumber :String        =       "Please enter valid phone number."
    internal let oKText        :String                =       "OK"
    internal let verifyPhone   :String                =       "Verify Phone"
    internal let OTPSentTo     :String                =       "OTP sent to"
    internal let submitButtonText     :String         =       "SUBMIT"
    internal let resendOTPAvailableIn    :String      =       "Resend OTP available in"
    internal let resendOTPAvailable    :String        =       "Resend OTP available"
    internal let s             :String                =       "s"
    
    
   


    
}
