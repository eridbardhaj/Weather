//
//  Weather.swift
//  Weather
//
//  Created by Erid Bardhaj on 4/27/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit
import ObjectMapper


//MARK: - Main Model
class Weather: Mappable
{
    var m_weather_code: Int = 0
    var m_weather_description: String = ""
    var m_lat: Double = 0.0
    var m_lng: Double = 0.0
    var m_city: String = ""
    var m_state: String = ""
    var m_temperature: Double = 0.0
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
        m_temperature <- map["main.temp"]
        m_windDirectionAngle <- map["wind.deg"]
        m_windSpeed <- map["wind.speed"]
        m_humidity <- map["main.humidity"]
        m_pressure <- map["main.pressure"]
        
        //TODO: Add m_preciptation   
    }
}

