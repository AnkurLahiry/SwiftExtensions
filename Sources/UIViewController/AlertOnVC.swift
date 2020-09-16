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
        guard let viewController = UIApplication.topViewController() else {
            fatalError("No View Controller found for showing an alert for you!")
        }
        let alertController = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
        let action = UIAlertAction(title: defaultActionTitle, style: .default, handler: alertAction)
        alertController.addAction(action)
        viewController.navigationController?.present(alertController, animated: true, completion: completionHandler)
    }
}
