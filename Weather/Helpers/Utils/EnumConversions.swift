//
//  EnumConversions.swift
//  Weather
//
//  Created by Erid Bardhaj on 28/04/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

class EnumConversions: NSObject
{

    //Gets API ID and turns the Weather Condition
    class func weatherCondition(code: Double) -> WeatherCondition
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
            return WeatherCondition.Sunny
        }
        else
        {
            return WeatherCondition.None
        }
    }
}
