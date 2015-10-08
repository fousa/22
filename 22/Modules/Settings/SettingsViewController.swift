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
    
    @IBOutlet var pickerView: FUYearPickerView!
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let year = FUDefaults.year {
            pickerView.selectedYear = year
        }
    }
    
    // MARK: - Actions
    
    @IBAction func close(sender: AnyObject) {
        FUDefaults.year = pickerView.selectedYear
        delegate?.settingsViewControllerShouldDismiss(self)
    }
    
}