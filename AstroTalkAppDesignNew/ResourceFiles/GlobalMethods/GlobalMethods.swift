//
//  GlobalMethods.swift
//  AstroTalkAppDesignNew
//
//  Created by Jogender Singh on 17/08/23.
//

import Foundation
import UIKit
class GlobalMethods{
    
    
    
    // TODO: SINGLETON OBJECT
    static let shared:GlobalMethods = GlobalMethods()
    private init(){}
    
    // MARK: - CALLBACKS
    internal var callBackPop:(()->())?
    
    // TODO: VIEW CONTROLLER HEADER FONT
    internal func headerFont()->UIFont{
        return UIFont(name: AppText.shared.poppinsRegular, size: 16) ??  UIFont.systemFont(ofSize: 16.0)
    }
    
    // TODO: ADD BACK BUTTON
    internal func addBackButton()->UIBarButtonItem{
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = UIColor(named: AppText.shared.k_Black)
        button.addTarget(self, action:#selector(backMethod), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        return UIBarButtonItem(customView: button)
    }
    
    // MARK: - SELECTORS
    // TODO: BACK BUTTONS
    @objc func backMethod() {
        self.callBackPop?()
    }
    
}
