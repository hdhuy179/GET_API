//
//  AppDelegate.swift
//  GET_API
//
//  Created by Hoang Dinh Huy on 9/14/19.
//  Copyright © 2019 Hoang Dinh Huy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window? = UIWindow(frame: UIScreen.main.bounds)
        
        let nav = UINavigationController()
        let vc = UIStoryboard.MainViewController
        nav.viewControllers = [vc]
        
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }

}
