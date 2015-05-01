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
    case Thunderstorm = 0, Cloudy, Rainy, Sunny, Snowy, Foggy, Windy, None
    
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
enum DegreeType
{
    case Celvin, Celcius, Fahrenheit, None
}

//MARK: - Wind
//Enum to keep track of Wind Metrics
enum WindSpeed
{
    case MPS, KMH, None
}

//Wind Direction
enum WindDirection : Int
{
    case North = 0, NorthEast, East, SouthEast, South, SouthWest, West, NorthWest, None
    
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