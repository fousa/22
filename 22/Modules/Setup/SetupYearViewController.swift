//
//  SetupYearViewController.swift
//  22
//
//  Created by Jelle Vandenbeeck on 05/10/15.
//  Copyright © 2015 Fousa. All rights reserved.
//

import UIKit

protocol SetupYearViewControllerDelegate {
    func yearViewControllerShouldDismiss(controller: SetupYearViewController)
}

class SetupYearViewController: UIViewController {
    
    var delegate: SetupYearViewControllerDelegate?
    
    @IBOutlet var pickerView: FUYearPickerView!
    
    // MARK: - Actions
    
    @IBAction func close(sender: AnyObject) {
        FUDefaults.year = pickerView.selectedYear
        delegate?.yearViewControllerShouldDismiss(self)
    }
    
}