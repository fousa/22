//
//  SetupDateViewController.swift
//  22
//
//  Created by Jelle Vandenbeeck on 05/10/15.
//  Copyright © 2015 Fousa. All rights reserved.
//

import UIKit

protocol SetupDateViewControllerDelegate {
    func dateViewControllerShouldDismiss(controller: SetupDateViewController)
}

class SetupDateViewController: UIViewController {
    
    var delegate: SetupDateViewControllerDelegate?
    
    @IBOutlet var dateField: UIDatePicker!
    
    // MARK: - Actions
    
    @IBAction func close(sender: AnyObject) {
        FUDefaults.birthdate = dateField.date
        delegate?.dateViewControllerShouldDismiss(self)
    }
    
}