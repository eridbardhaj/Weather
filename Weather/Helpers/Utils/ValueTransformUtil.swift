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
    
    
    /**
    Find icon name for weather
    
    :param: weather Enum Parameter
    
    :returns: name of the icon
    */
    class func getWeatherIconName(weather: WeatherCondition) -> String
    {
        switch weather
        {
        case WeatherCondition.Thunderstorm:
            return "fc-cl"
            
        case WeatherCondition.Sunny:
            return "fc-sun"
            
        case WeatherCondition.Cloudy:
            return "fc-cs"
            
        case WeatherCondition.Windy:
            return "fc-cs"
            
        //FIXME: Needed icons here, we don't have resources
        case WeatherCondition.Rainy:
            return ""
            
        case WeatherCondition.Snowy:
            return ""
            
        case WeatherCondition.Foggy:
            return ""
            
        default:
            return ""
        }
    }
    
    //MARK: - Date Operations
    class func getDayName(timestamp: NSTimeInterval) -> String
    {
        var date = NSDate(timeIntervalSince1970: timestamp)
        var calendar = NSCalendar()
        var component: NSDateComponents = calendar.components(NSCalendarUnit.CalendarUnitWeekday, fromDate: date) as NSDateComponents
        
        
        return getDayString(component.weekday)
        
    }
    
    class func getDayString(day_id: Int) -> String
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
}
