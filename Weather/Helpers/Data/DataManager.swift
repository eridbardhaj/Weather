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
    //MARK: Units
    var m_tempUnit : TemperatureUnit
    {
        get
        {
            let defaults = NSUserDefaults(suiteName: Constants.Defaults.appGroupName())
            if let value = defaults!.integerForKey("unit_temperature") as Int?
            {
                return TemperatureUnit(rawValue: value)!
            }
            else
            {
                return TemperatureUnit(rawValue: 0)!
            }
        }
        set (newValue)
        {
            let defaults = NSUserDefaults(suiteName: Constants.Defaults.appGroupName())
            defaults!.setInteger(newValue.rawValue, forKey: "unit_temperature")
            defaults!.synchronize()
        }
    }
    
    var m_length_unit : WindSpeedUnit
    {
        get
        {
            let defaults = NSUserDefaults(suiteName: Constants.Defaults.appGroupName())
            if let value = defaults!.integerForKey("unit_length") as Int?
            {
                return WindSpeedUnit(rawValue: value)!
            }
            else
            {
                return WindSpeedUnit(rawValue: 0)!
            }
        }
        set (newValue)
        {
            let defaults = NSUserDefaults(suiteName: Constants.Defaults.appGroupName())
            defaults!.setInteger(newValue.rawValue, forKey: "unit_length")
            defaults!.synchronize()
        }
    }
    
    
    //MARK: Saving Location (optional)
    var m_city : String
        {
        get
        {
            let defaults = NSUserDefaults(suiteName: Constants.Defaults.appGroupName())
            var value: NSString? = defaults!.objectForKey("current_city_name") as? NSString
            
            return (value == nil) ? "" : "\(value)"
        }
        set (newValue)
        {
            let defaults = NSUserDefaults(suiteName: Constants.Defaults.appGroupName())
            defaults!.setObject(newValue as NSString, forKey: "current_city_name")
            defaults!.synchronize()
        }
    }
    
    var m_city_lat: Double
    {
        get
        {
            let defaults = NSUserDefaults(suiteName: Constants.Defaults.appGroupName())
            var value: NSNumber? = defaults!.objectForKey("current_city_lat") as? NSNumber
            
            return (value == nil) ? 0.0 : value!.doubleValue
        }
        set (newValue)
        {
            let defaults = NSUserDefaults(suiteName: Constants.Defaults.appGroupName())
            defaults!.setObject(NSNumber(double: newValue), forKey: "current_city_lat")
            defaults!.synchronize()
        }
    }
    
    var m_city_lng: Double
    {
        get
        {
            let defaults = NSUserDefaults(suiteName: Constants.Defaults.appGroupName())
            var value: NSNumber? = defaults!.objectForKey("current_city_lng") as? NSNumber
            
            return (value == nil) ? 0.0 : value!.doubleValue
        }
        set (newValue)
        {
            let defaults = NSUserDefaults(suiteName: Constants.Defaults.appGroupName())
            defaults!.setObject(NSNumber(double: newValue), forKey: "current_city_lng")
            defaults!.synchronize()

        }
    }
    
    //MARK: - Methods
    
    //Get local settings
    func getSettings() -> [Setting]
    {
        let currentLengthUnit = DataManager.shared.m_length_unit.rawValue
        var setting1 = Setting(unit: "Units of length", currentValue: currentLengthUnit, allValues: [0, 1, 2], unitType: UnitType.Length)
        
        let currentTempUnit = DataManager.shared.m_tempUnit.rawValue
        var setting2 = Setting(unit: "Units of temperature", currentValue: currentTempUnit, allValues: [0, 1, 2], unitType: UnitType.Temperature)
        
        return [setting1, setting2]
    }
    
    //MARK: Observers
    //Observers
    func createObserver(controller: NSObject)
    {
        NSNotificationCenter.defaultCenter().addObserver(controller, selector: "loadData", name: ObserverType.Settings.description, object: nil)
    }
}
