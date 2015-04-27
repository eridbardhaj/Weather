//
//  Weather.swift
//  Weather
//
//  Created by Erid Bardhaj on 4/27/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

//Enum to keep track of weather condition
enum WeatherCondition
{
    case Windy, Cloudy, Rainy, Sunny, None
}

//Enum to keep track of DegreeType
enum DegreeType
{
    case Celvin, Celcius, Fahrenheit, None
}

//MARK: - Main Model
class Weather: NSObject
{
    var m_is_current_location: Bool
    var m_weather_icon: WeatherCondition
    var m_coordinate: Coordinate
    var m_city: String
    var m_state: String
    var m_degree: Double
    var m_degree_type: DegreeType
    var m_weather_condition: WeatherCondition
    var m_wind: Wind
    var m_humidity: Double
    var m_pressure: Double
    var m_rain_mm: Double
    
    override init()
    {
        m_is_current_location = false
        m_weather_icon = WeatherCondition.None
        m_coordinate = Coordinate()
        m_city = ""
        m_state = ""
        m_degree = 25
        m_degree_type = DegreeType.Celcius
        m_weather_condition = WeatherCondition.None
        m_humidity = 0.0
        m_pressure = 0.0
        m_rain_mm = 0.0
        m_wind = Wind()
    }
}

//MARK: - Helper Models
class Wind
{
    var speed: Double = 0.0
    var type: String = ""
    var direction: String = ""
    
    init()
    {
        speed = 0.0
        type = ""
        direction = ""
    }
}

class Coordinate
{
    var lat: Double = 0.0
    var lng: Double = 0.0
    
    init()
    {
        lat = 0.0
        lng = 0.0
    }
}
