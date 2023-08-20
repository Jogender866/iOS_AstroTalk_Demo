//
//  Alearts.swift
//  AstroTalkAppDesignNew
//
//  Created by Jogender Singh on 14/08/23.
//

import Foundation
import UIKit
class Alearts{
    // TODO: SINGLETON OBJECT
    static let shared:Alearts = Alearts()
    private init(){}
    
    // MARK: -  CALL BACKS
    // TODO: OK CALLBACK
    internal var callBackOk:(()->())?
    
    
    // TODO: SHOW ALERT WITH ONE BUTTON
    internal func showAlertWithOkButton(view:UIViewController,title:String,message:String,buttonTitle:String,complition: @escaping (()->())) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonTitle, style: .default) { (action:UIAlertAction!) in
            print("Ok button tapped")
            complition()
        }
        alertController.addAction(okAction)
        view.present(alertController, animated: true, completion: nil)
    }
}
