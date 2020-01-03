//
//  AppDelegate.swift
//  CollectionView-Mark
//
//  Created by 李京珂 on 2019/10/10.
//  Copyright © 2019 李京珂. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    window = UIWindow(frame: UIScreen.main.bounds)
    let navigationC = UINavigationController(rootViewController: ViewController())
    window?.rootViewController = navigationC
    window?.makeKeyAndVisible()
    
    IQKeyboardManager.shared.enable = true
    return true
  }
}

