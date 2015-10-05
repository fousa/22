//
//  SetupInfoViewController.swift
//  22
//
//  Created by Jelle Vandenbeeck on 05/10/15.
//  Copyright © 2015 Fousa. All rights reserved.
//

import UIKit

protocol SetupInfoViewControllerDelegate {
    func infoViewControllerShouldPresentNext(controller: SetupInfoViewController)
}

class SetupInfoViewController: UIViewController {
    
    var delegate: SetupInfoViewControllerDelegate?
    
    // MARK: - Actions
    
    @IBAction func next(sender: AnyObject) {
        delegate?.infoViewControllerShouldPresentNext(self)
    }
    
}