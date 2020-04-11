//
//  AppDelegate.swift
//  httpwithRequest
//
//  Created by Mr. Bear on 08.04.2020.
//  Copyright © 2020 Mr. Bear. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    var bgSessionComplitionHandler: (()->())?
    
    func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
       
             bgSessionComplitionHandler = completionHandler
    }
}

