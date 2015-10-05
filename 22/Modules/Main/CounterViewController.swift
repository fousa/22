//
//  CounterViewController.swift
//  22
//
//  Created by Jelle Vandenbeeck on 05/10/15.
//  Copyright © 2015 Fousa. All rights reserved.
//

import UIKit

class CounterViewController: UIViewController, SettingsViewControllerDelegate {
    
    // MARK: - Actions
    
    @IBAction func openSettings(sender: AnyObject) {
        let controller = UIStoryboard(name: "Settings", bundle: nil).instantiateInitialViewController() as! SettingsViewController
        controller.delegate = self
        presentViewController(controller, animated: true, completion: nil)
    }
    
    // MARK: - SettingsViewControllerDelegate
    
    func settingsViewControllerShouldDismiss(controller: SettingsViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
