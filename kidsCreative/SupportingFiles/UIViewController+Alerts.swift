//
//  UIViewController+Alerts.swift
//  kidsCreative
//
//  Created by Margiett Gil on 4/16/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

extension UIViewController {
    public func showAlert(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "okay", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    
}
