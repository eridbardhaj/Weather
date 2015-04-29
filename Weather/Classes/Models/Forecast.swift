//
//  Forecast.swift
//  Weather
//
//  Created by Erid Bardhaj on 4/29/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

class Forecast: NSObject
{
    var m_weatherCondition: WeatherCondition
    var m_day: String
    var m_degree: Double
    
    //Init the default values
    override init()
    {
        m_weatherCondition = WeatherCondition.None
        m_day = ""
        m_degree = 0.0
    }
}
