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
  
        cleanupDefaults()
        presentSetupFlowIfNeeded()
        
        return true
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        presentSetupFlowIfNeeded()
    }
    
    // MARK: - Testing
    
    private func cleanupDefaults() {
        if NSProcessInfo.processInfo().arguments.contains("uiTesting") {
            FUDefaults.year = nil
        }
    }
    
    // MARK: - Setup
    
    private func presentSetupFlowIfNeeded() {
        guard FUDefaults.year == nil else {
            // Ignore the rest of the code when a birthdate is found.
            return
        }
        
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

