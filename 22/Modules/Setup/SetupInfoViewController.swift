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
    
    @IBOutlet var imageView: UIImageView!
    
    var delegate: SetupInfoViewControllerDelegate?
    
    // MARK: - View flow
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        imageView.image = UIImage(named: NSLocalizedString("setup.image.algoritm", comment: "The algorim asset"))
    }
    
    // MARK: - Actions
    
    @IBAction func next(sender: AnyObject) {
        delegate?.infoViewControllerShouldPresentNext(self)
    }
    
}