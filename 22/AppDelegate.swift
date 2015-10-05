//
//  AppDelegate.swift
//  22
//
//  Created by Jelle Vandenbeeck on 05/10/15.
//  Copyright © 2015 Fousa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, SetupViewControllerDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window?.makeKeyAndVisible()
        
        presentSetupFlowIfNeeded()
        
        return true
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        presentSetupFlowIfNeeded()
    }
    
    // MARK: - Setup
    
    private func presentSetupFlowIfNeeded() {
        let controller = UIStoryboard(name: "Setup", bundle: nil).instantiateInitialViewController() as! SetupViewController
        controller.delegate = self
        dispatch_async(dispatch_get_main_queue()) {
            self.window?.rootViewController?.presentViewController(controller, animated: false, completion: nil)
        }
    }
    
    // MARK: - SetupViewControllerDelegate
    
    func setupViewControllerShouldDismiss(sender: AnyObject) {
        window?.rootViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}

