//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Erid Bardhaj on 30/04/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

class TodayViewModel: NSObject
{
    var m_weatherImageName: String = ""
    var m_currentLocation: String = ""
    var m_currentWeatherInfo: String = ""
    var m_humidity: String = ""
    var m_directionAngle: String = ""
    var m_windSpeed: String = ""
    var m_pressure: String = ""
    var m_precipitation: String = ""
    
    init(model: Weather)
    {
        m_weatherImageName = ValueTransformUtil.getWeatherCondition(model.m_weather_code).todayWeatherIconName
        
        m_currentLocation = "\(model.m_city)"
        m_currentLocation += (count(model.m_state)>0) ? ", \(model.m_state)" : ""
        
        m_humidity = "\(model.m_humidity)%"
        m_directionAngle = ValueTransformUtil.getWindDirection(model.m_windDirectionAngle)
        
        //FIXME: Need to be converted correctly
        m_precipitation = "0.2 mm"
        m_pressure = String(format: "%.0f", model.m_pressure) + " hpa"
        m_windSpeed = String(format: "%.1f", model.m_windSpeed) + " km/h"
        m_currentWeatherInfo = String(format: "%.0f", model.m_temperature) + "° | \(model.m_weather_description)"
    }
}
