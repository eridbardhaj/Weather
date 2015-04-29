//
//  DataManager.swift
//  Weather
//
//  Created by Erid Bardhaj on 4/29/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

class DataManager: NSObject
{
    //Singleton pattern
    class var shared: DataManager
    {
        struct Static
        {
            static var onceToken: dispatch_once_t = 0
            static var instance: DataManager? = nil
        }
        
        dispatch_once(&Static.onceToken)
            {
                Static.instance = DataManager()
        }
        return Static.instance!
    }
    
    
    //MARK: - Custom getters and setters
    var city : String
    {
        get
        {
            let defaults = NSUserDefaults(suiteName: Constants.Defaults.appGroupName())
            var value: NSString? = defaults!.objectForKey("current_city_name") as? NSString
            
            return (value != nil) ? "" : "\(value)"
        }
        set (newValue)
        {
            let defaults = NSUserDefaults(suiteName: Constants.Defaults.appGroupName())
            defaults!.setObject(newValue as NSString, forKey: "current_city_name")
            defaults!.synchronize()
        }
    }
    
    var temperature : String
    {
        get
        {
            let defaults = NSUserDefaults(suiteName: Constants.Defaults.appGroupName())
            var value: NSString? = defaults!.objectForKey("unit_temperature") as? NSString
            
            return (value != nil) ? "" : "\(value)"
        }
        set (newValue)
        {
            let defaults = NSUserDefaults(suiteName: Constants.Defaults.appGroupName())
            defaults!.setObject(newValue as NSString, forKey: "unit_temperature")
            defaults!.synchronize()
        }
    }
    
    var length : String
    {
        get
        {
            let defaults = NSUserDefaults(suiteName: Constants.Defaults.appGroupName())
            var value: NSString? = defaults!.objectForKey("unit_length") as? NSString
            
            return (value != nil) ? "" : "\(value)"
        }
        set (newValue)
        {
            let defaults = NSUserDefaults(suiteName: Constants.Defaults.appGroupName())
            defaults!.setObject(newValue as NSString, forKey: "unit_length")
            defaults!.synchronize()
        }
    }
    
    var city_lat: Double
    {
        get
        {
            let defaults = NSUserDefaults(suiteName: Constants.Defaults.appGroupName())
            var value: NSNumber? = defaults!.objectForKey("current_city_lat") as? NSNumber
            
            return (value != nil) ? 0.0 : value!.doubleValue
        }
        set (newValue)
        {
            let defaults = NSUserDefaults(suiteName: Constants.Defaults.appGroupName())
            defaults!.setObject(NSNumber(double: newValue), forKey: "current_city_lat")
            defaults!.synchronize()
        }
    }
    
    var city_lng: Double
    {
        get
        {
            let defaults = NSUserDefaults(suiteName: Constants.Defaults.appGroupName())
            var value: NSNumber? = defaults!.objectForKey("current_city_lng") as? NSNumber
            
            return (value != nil) ? 0.0 : value!.doubleValue
        }
        set (newValue)
        {
            let defaults = NSUserDefaults(suiteName: Constants.Defaults.appGroupName())
            defaults!.setObject(NSNumber(double: newValue), forKey: "current_city_lng")
            defaults!.synchronize()
        }
    }
}
