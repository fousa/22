//
//  SettingsViewController.swift
//  22
//
//  Created by Jelle Vandenbeeck on 05/10/15.
//  Copyright © 2015 Fousa. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func settingsViewControllerShouldDismiss(controller: SettingsViewController)
}

class SettingsViewController: UIViewController {
    
    var delegate: SettingsViewControllerDelegate?
    
    // MARK: - Actions
    
    @IBAction func close(sender: AnyObject) {
        delegate?.settingsViewControllerShouldDismiss(self)
    }
    
}