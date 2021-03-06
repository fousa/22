//
//  SetupViewController.swift
//  22
//
//  Created by Jelle Vandenbeeck on 05/10/15.
//  Copyright © 2015 Fousa. All rights reserved.
//

import UIKit

protocol SetupViewControllerDelegate {
    func setupViewControllerShouldDismiss(sender: AnyObject)
}

class SetupViewController: UIViewController, SetupInfoViewControllerDelegate, SetupYearViewControllerDelegate {
    
    var delegate: SetupViewControllerDelegate?
    
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // leftConstraint.constant = 200
    }
    
    // MARK: - Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller = segue.destinationViewController as? SetupInfoViewController {
            controller.delegate = self
        } else if let controller = segue.destinationViewController as? SetupYearViewController {
            controller.delegate = self
        }
    }
    
    // MARK: - SetupInfoViewControllerDelegate
    
    func infoViewControllerShouldPresentNext(controller: SetupInfoViewController) {
        leftConstraint.constant = -view.frame.size.width
        UIView.animateWithDuration(0.35, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2, options: .CurveEaseInOut, animations: { () -> Void in
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    // MARK: - SetupDateViewControllerDelegate
    
    func yearViewControllerShouldDismiss(controller: SetupYearViewController) {
        delegate?.setupViewControllerShouldDismiss(self)
    }
    
    // MARK: - Status bar
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}