//
//  Enums.swift
//  Weather
//
//  Created by Erid Bardhaj on 5/1/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

//Track the errors
enum ErrorType
{
    case Network, Server, GPS, None
}

//Enum to keep track of weather condition
enum WeatherCondition : Int
{
    //Values
    case Thunderstorm = 0, Cloudy, Rainy, Sunny, Snowy, Foggy, Windy, None
    
    //Get icon name depending on enum value
    var forecastIconName : String
        {
        get
        {
            switch(self)
            {
            case .Thunderstorm:
                return "fs-cl"
                
            case .Cloudy:
                return "fc-cs"
                
            case .Sunny:
                return "fc-sun"
                
            case .Windy:
                return "fc-wind"
                
            //FIXME: I don't have these resources
//            case .Rainy:
//                return ""
//                
//            case .Snowy:
//                return ""
//                
//            case .Foggy:
//                return ""
                
            default:
                return "fc-sun"
            }
        }
    }
    
    var todayWeatherIconName : String
        {
        get
        {
            switch(self)
            {
            case .Thunderstorm:
                return "tod-lighting-blig"
                
            case .Cloudy:
                return "tod-cloudy-big"
                
            case .Sunny:
                return "tod-sun-big"
                
            case .Windy:
                return "tod-wind-big"
                
            //FIXME: I don't have these resources
//            case .Rainy:
//                return ""
//                
//            case .Snowy:
//                return ""
//                
//            case .Foggy:
//                return ""
                
            default:
                return "tod-sun-big"
            }
        }
    }
}

//Enum to keep track of DegreeType
enum TemperatureUnit: Int
{
    //Values
    case Celcius=0, Kelvin, Fahrenheit, None
    
    //All Elements
    static let allElements: [TemperatureUnit] = [Celcius, Kelvin, Fahrenheit]
    
    //Description
    var description : String
    {
        get
        {
            switch(self)
            {
            case .Celcius:
                return "°C"
                
            case .Kelvin:
                return "K"
                
            case .Fahrenheit:
                return "°F"
                
            default:
                return "°C"
            }
        }
    }
    
    /**
    Default value from the API is celcius, so this method converts the value depending on its own type
    
    :param: celcius celcius degrees
    
    :returns: converted value depending on type
    */
    func getDegree(celcius: Double) -> Double
    {
        switch(self)
        {
        case .Celcius:
            return celcius
            
        case .Kelvin:
            return celcius+273.16
            
        case .Fahrenheit:
            return (celcius*2.0)+30.0
            
        default:
            return celcius
        }
    }
}

//MARK: - Wind
//Enum to keep track of Wind Metrics
enum WindSpeedUnit : Int
{
    //Values
    case MPS = 0, KMH, MPH, None
    
    //Array with all elements
    static let allElements: [WindSpeedUnit] = [MPS, KMH, MPH]
    
    //Description
    var description : String
    {
        get
        {
            switch(self)
            {
            case .MPS:
                return "m/s"
                
            case .KMH:
                return "km/h"
                
            case .MPH:
                return "mph"
                
            default:
                return "m/s"
            }
        }
    }
    
    //Conversions from m/s
    func getSpeed(speed: Double) -> Double
    {
        switch(self)
        {
        case .MPS:
            return speed
            
        case .KMH:
            return speed*3.6
            
        case .MPH:
            return speed*2.23694
            
        default:
            return speed
        }
    }
}

//Wind Direction
enum WindDirection : Int
{
    //Values
    case North = 0, NorthEast, East, SouthEast, South, SouthWest, West, NorthWest, None
    
    //Get Description of an enum
    var description : String
    {
        get
        {
            switch(self)
            {
            case .North:
                return "N"
                
            case .NorthEast:
                return "NE"
                
            case .East:
                return "E"
                
            case .SouthEast:
                return "SE"
                
            case .South:
                return "S"
                
            case .SouthWest:
                return "SW"
                
            case .West:
                return "W"
                
            case .NorthWest:
                return "NW"
                
            default:
                return ""
            }
        }
    }
}

//Unit type used in Settings
enum UnitType : Int
{
    case Length=0, Temperature, None
}

//Enum used for observing
enum ObserverType: String
{
    case Settings = "pref_changed"
    case LocationFound = "location_found"
    
    //Get description
    var description: String
    {
        get
        {
            return self.rawValue
        }
    }
}

//Enum to keep track of segue Identifiers
enum SegueControllerID: String
{
    case ChooseUnit = "choose_unit_id"
    
    //Get description
    var description: String
    {
        get
        {
            switch self
            {
            case .ChooseUnit:
                return self.rawValue
                
            default:
                return ""
            }
        }
    }
}