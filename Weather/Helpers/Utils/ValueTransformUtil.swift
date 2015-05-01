//
//  EnumConversions.swift
//  Weather
//
//  Created by Erid Bardhaj on 28/04/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

class ValueTransformUtil: NSObject
{
    //MARK: - Value Transformation
    /**
    Transforms weather code from API to meaningful condition
    
    :param: code Code received from Open Weather API
    
    :returns: Enum Value of WeatherCondition
    */
    class func getWeatherCondition(code: Int) -> WeatherCondition
    {
        if (code>=200 && code<300)
        {
            return WeatherCondition.Thunderstorm
        }
        else if (code>=300 && code<400)
        {
            return WeatherCondition.Rainy
        }
        else if (code>=500 && code<600)
        {
            return WeatherCondition.Rainy
        }
        else if (code>=600 && code<700)
        {
            return WeatherCondition.Snowy
        }
        else if (code>=700 && code<800)
        {
            return WeatherCondition.Foggy
        }
        else if (code>=800 && code<805)
        {
            if code == 800
            {
                return WeatherCondition.Sunny
            }
            else
            {
                return WeatherCondition.Cloudy
            }
        }
        else if (code==905 || code==957)
        {
            return WeatherCondition.Windy
        }
        else
        {
            return WeatherCondition.None
        }
    }
    
    //MARK: - Date Operations
    /**
    Get name of a day at specific time
    
    :param: timestamp time in seconds from 1970
    
    :returns: day name
    */
    class func getDayName(timestamp: NSTimeInterval) -> String
    {
        var date = NSDate(timeIntervalSince1970: timestamp)
        var calendar = NSCalendar.currentCalendar()
        var component: NSDateComponents = calendar.components(NSCalendarUnit.CalendarUnitWeekday, fromDate: date) as NSDateComponents
        
        
        return getDayString(component.weekday)
        
    }
    
    private class func getDayString(day_id: Int) -> String
    {
        switch day_id
        {
        case 1:
            return "Sunday"
            
        case 2:
            return "Monday"
            
        case 3:
            return "Tuesday"
            
        case 4:
            return "Wednesday"
            
        case 5:
            return "Thursday"
            
        case 6:
            return "Friday"
            
        case 7:
            return "Saturday"
            
        case 8:
            return "Sunday"
            
        default:
            return ""
            
        }
    }
    
    //MARK: - Orientation Operations
    /**
    Get the wind direction (EN, E, etc) by giving degrees
    
    :param: degree Angle degrees [0, 360]
    
    :returns: Wind direction
    */
    class func getWindDirection(degree: Double) -> String
    {
        var area = getArea(degree)
        var direction = WindDirection(rawValue: area)
        
        return direction!.description
    }
    
    private class func getArea(interval: Double) -> Int
    {
        var area = Int(round((interval/360.0)*8))
        area = (area==8) ? 0 : area
        
        return area
    }
}
