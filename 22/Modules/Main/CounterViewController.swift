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
    @IBOutlet var descriptionLabel: UILabel!
    
    // MARK: - View flow
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let year = FUDefaults.year {
            let calendar = NSCalendar.currentCalendar()
            let todayComponents = calendar.component(.Year, fromDate: NSDate())
            let minimumAge = floor((Float(todayComponents - year) / 2.0) + 7.0)
            yearsLabel.text = "\(Int(minimumAge))"
            
            let text = NSString(format: NSLocalizedString("main.label.description", comment: "Age description"), Int(minimumAge)) as String
            let attributes = [
                NSFontAttributeName : descriptionLabel.font,
                NSForegroundColorAttributeName : descriptionLabel.textColor
            ]
            let attributedString = NSMutableAttributedString(string: text, attributes: attributes)
            let range = (text as NSString).rangeOfString(String(Int(minimumAge)))
            attributedString.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(14.0, weight: UIFontWeightSemibold), range: range)
            descriptionLabel.attributedText = attributedString
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
