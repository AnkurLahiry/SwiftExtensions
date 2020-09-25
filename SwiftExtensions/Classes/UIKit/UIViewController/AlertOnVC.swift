//
//  UIAlertControllerExtensions.swift
//  SwiftExtensions
//
//  Created by Ankur on 16/9/20.
//

import Foundation

public extension UIViewController {
    
    func showDefaultAlert(title : String?,
                          message : String?,
                          defaultActionTitle : String = "OK",
                          alertStyle : UIAlertControllerStyle = .alert,
                          alertAction : ((UIAlertAction) -> Void)? = nil,
                          completionHandler : (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title?.localized, message: message?.localized, preferredStyle: alertStyle)
        let action = UIAlertAction(title: defaultActionTitle.localized, style: .default, handler: alertAction)
        alertController.addAction(action)
        self.navigationController?.present(alertController, animated: true, completion: completionHandler)
    }
    
    func showDefaultErrorAlert(
        message : String?,
        defaultActionTitle : String = "OK",
        alertStyle : UIAlertControllerStyle = .alert,
        alertAction : ((UIAlertAction) -> Void)? = nil,
        completionHandler : (() -> Void)? = nil) {
        self.showDefaultAlert(title: "Error", message: message, defaultActionTitle: defaultActionTitle, alertStyle: .alert, alertAction: alertAction, completionHandler: completionHandler)
    }
    
}
