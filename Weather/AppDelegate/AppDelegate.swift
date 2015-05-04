//
//  AppDelegate.swift
//  Weather
//
//  Created by Erid Bardhaj on 4/27/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit
import CoreLocation
import WatchKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //Get current location
        LocationManager.shared.getCurrentLocation()
        
        //Control UIApperance to customise layout
        changeLayout()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //MARK: - WatchKit
    func application(application: UIApplication, handleWatchKitExtensionRequest userInfo: [NSObject : AnyObject]?, reply: (([NSObject : AnyObject]!) -> Void)!)
    {
        //Make the call to API
        WeatherNetwork.getForecastWeatherByCoordinates(DataManager.shared.m_city_lat, lng: DataManager.shared.m_city_lng, responseHandler:
            {
                (error, array) -> (Void) in
                if error == ErrorType.None
                {
                    var response: NSDictionary = NSDictionary(dictionary: ["response" : array as! AnyObject])
                    reply(response as [NSObject : AnyObject])
                }
                else
                {
                    //Handle Error
                    reply(nil)
                }
        })
    }
    
    //MARK: - Custom Settings
    func changeLayout()
    {
        //Navigation Bar customization
        UINavigationBar.appearance().setBackgroundImage(UIImage.new(), forBarMetrics: UIBarMetrics.Default)
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName : UIFont(name: "ProximaNova-Semibold", size: 18.0)!, NSForegroundColorAttributeName: Constants.Colors.blackColor()]
        UINavigationBar.appearance().backItem?.backBarButtonItem?.tintColor = Constants.Colors.lightBlue()
        
        
        //UIBarButtonItem Attributes
        var barAttribs = [NSFontAttributeName : UIFont(name: "ProximaNova-Regular", size: 16.0)!, NSForegroundColorAttributeName: Constants.Colors.lightBlue()]
        
        UIBarButtonItem.appearance().setTitleTextAttributes(barAttribs, forState: UIControlState.Normal)
        UIBarButtonItem.appearance().tintColor = Constants.Colors.lightBlue()
        
        
        //UITabBar Attributes
        var tabAttribsNormal = [NSFontAttributeName : UIFont(name: "ProximaNova-Semibold", size: 10.0)!, NSForegroundColorAttributeName: Constants.Colors.blackColor()]
        var tabAttribsSelected = [NSFontAttributeName : UIFont(name: "ProximaNova-Semibold", size: 10.0)!, NSForegroundColorAttributeName: Constants.Colors.lightBlue(), ]
        
        UITabBarItem.appearance().setTitleTextAttributes(tabAttribsNormal, forState: UIControlState.Normal)
        UITabBarItem.appearance().setTitleTextAttributes(tabAttribsSelected, forState: UIControlState.Selected)
        
        //Changing image tint color
        UITabBar.appearance().tintColor = Constants.Colors.lightBlue()
        UITabBar.appearance().backgroundImage = UIImage()
    }
}

