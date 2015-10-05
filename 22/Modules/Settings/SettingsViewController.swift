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
    
    @IBOutlet var dateField: UIDatePicker!
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let date = FUDefaults.birthdate {
            dateField.date = date
        }
    }
    
    // MARK: - Actions
    
    @IBAction func close(sender: AnyObject) {
        FUDefaults.birthdate = dateField.date
        delegate?.settingsViewControllerShouldDismiss(self)
    }
    
}