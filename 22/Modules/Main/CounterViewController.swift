//
//  CounterViewController.swift
//  22
//
//  Created by Jelle Vandenbeeck on 05/10/15.
//  Copyright © 2015 Fousa. All rights reserved.
//

import UIKit

class CounterViewController: UIViewController, SettingsViewControllerDelegate {
    
    @IBOutlet var yearsLabel: UILabel!
    
    // MARK: - View flow
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let year = FUDefaults.year {
            let calendar = NSCalendar.currentCalendar()
            let todayComponents = calendar.component(.Year, fromDate: NSDate())
            let minimumAge = round((Float(todayComponents - year) / 2.0) + 7.0)
            yearsLabel.text = "\(Int(minimumAge))"
        }
    }
    
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
    
    // MARK: - Status bar
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}
