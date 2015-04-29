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
    case Windy, Cloudy, Rainy, Sunny, None
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
    
    required init?(_ map: Map) {
        mapping(map)
    }
    
    // Mappable
    func mapping(map: Map) {
        username    <- map["username"]
        age         <- map["age"]
        weight      <- map["weight"]
        array       <- map["arr"]
        dictionary  <- map["dict"]
        bestFriend  <- map["best_friend"]
        friends     <- map["friends"]
        birthday    <- (map["birthday"], DateTransform())
    }
}

//MARK: - Helper Models
class Wind
{
    var speed: Double = 0.0
    var type: String = ""
    var direction: String = ""
}

class Coordinate
{
    var lat: Double = 0.0
    var lng: Double = 0.0

}
