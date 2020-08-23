//
//  UIViewController+.swift
//  Programmatically
//
//  Created by Satyadev Chauhan on 22/08/20.
//  Copyright © 2020 Satyadev Chauhan. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Helper to show alert with OK action.
    ///
    /// - Parameters:
    ///   - title: Title for alert.
    ///   - message: Message for alert.
    ///   - completion: Completion handler for OK.
    func showAlert(title: String, message: String, completion: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertOK = UIAlertAction(title: "OK".localized, style: .cancel, handler: completion)
        alert.addAction(alertOK)
        present(alert, animated: true, completion: nil)
    }
}
