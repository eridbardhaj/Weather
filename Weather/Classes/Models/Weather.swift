//
//  Weather.swift
//  Weather
//
//  Created by Erid Bardhaj on 4/27/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit
import ObjectMapper

//Enum to keep track of weather condition
enum WeatherCondition
{
    case Thunderstorm, Cloudy, Rainy, Sunny, Snowy, Foggy, Windy, None
}

//Enum to keep track of DegreeType
enum DegreeType
{
    case Celvin, Celcius, Fahrenheit, None
}

//Enum to keep track of Wind Metrics
enum WindMetrics
{
    case MetersPerSecond, KilometersPerHour, None
}

//MARK: - Main Model
class Weather: Mappable
{
    var m_weather_code: Int = 0
    var m_weather_description: String = ""
    var m_lat: Double = 0.0
    var m_lng: Double = 0.0
    var m_city: String = ""
    var m_state: String = ""
    var m_degree: Double = 0.0
    var m_windDirectionAngle: Double = 0.0
    var m_windSpeed: Double = 0.0
    var m_humidity: Double = 0.0
    var m_pressure: Double = 0.0
    var m_precipitation: Double = 0.0
    
    required init?(_ map: Map)
    {
        mapping(map)
    }
    
    //MARK: - Mappable
    func mapping(map: Map)
    {
        let coord = map["coord"]
        
        var weather_array: NSArray = NSArray()
        weather_array   <- map["weather"]
        var weather_object: NSDictionary = weather_array[0] as! NSDictionary
        
        
        m_weather_code = weather_object["id"] as! Int
        m_weather_description = weather_object["main"] as! String
        m_lat <- map["coord.lat"]
        m_lng <- map["coord.lon"]
        m_city <- map["name"]
        m_state <- map["country"]
        m_degree <- map["main.temp"]
        m_windDirectionAngle <- map["wind.deg"]
        m_windSpeed <- map["wind.speed"]
        m_humidity <- map["main.humidity"]
        m_pressure <- map["main.pressure"]
        
        //TODO: Add m_preciptation
        
    }
    
    //TODO: Clean up this code after testing
//    {
//    "coord": {
//    "lon": 139,
//    "lat": 35
//    },
//    "sys": {
//    "message": 1.2659,
//    "country": "JP",
//    "sunrise": 1430337254,
//    "sunset": 1430386094
//    },
//    "weather": [
//    {
//    "id": 800,
//    "main": "Clear",
//    "description": "Sky is Clear",
//    "icon": "01n"
//    }
//    ],
//    "base": "stations",
//    "main": {
//    "temp": 290.697,
//    "temp_min": 290.697,
//    "temp_max": 290.697,
//    "pressure": 1022,
//    "sea_level": 1029.92,
//    "grnd_level": 1022,
//    "humidity": 94
//    },
//    "wind": {
//    "speed": 4.76,
//    "deg": 73.0052
//    },
//    "clouds": {
//    "all": 0
//    },
//    "dt": 1430395043,
//    "id": 1851632,
//    "name": "Shuzenji",
//    "cod": 200
//    }
}

