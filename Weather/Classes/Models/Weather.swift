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
    case Thunderstorm, Cloudy, Rainy, Sunny, Snowy, Foggy, None
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
    var m_weatherCondition: Double?
    var m_weatherDescription: String?
    var m_lat: Double?
    var m_lng: Double?
    var m_city: String?
    var m_state: String?
    var m_degree: Double?
    var m_windDirection: String?
    var m_windSpeed: Double?
    var m_humidity: Double?
    var m_pressure: Double?
//    var m_precipitation: Double?
    
    required init?(_ map: Map)
    {
        mapping(map)
    }
    
    //MARK: - Mappable
    func mapping(map: Map)
    {
        m_weatherCondition    <- map["weather.$0.id"]
        m_weatherDescription  <- map["weather.$0.description"]
        m_lat                 <- map["coord.lat"]
        m_lng                 <- map["coord.lon"]
        m_city                <- map["name"]
        m_state               <- map["sys.country"]
        m_degree              <- map["main.temp"]
        m_windDirection       <- map["wind.deg"]
        m_windSpeed           <- map["wind.speed"]
        m_humidity            <- map["main.humidity"]
        m_pressure            <- map["main.pressure"]
//        m_precipitation       <- map["username"]
    }
}

