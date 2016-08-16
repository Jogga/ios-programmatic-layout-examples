//
//  AppDelegate.swift
//  ios-programmatic-layout-examples
//
//  Created by Joachim Fröstl on 16.08.16.
//  Copyright © 2016 Joachim Fröstl. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = .whiteColor()
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController()
        return true
    }
}

