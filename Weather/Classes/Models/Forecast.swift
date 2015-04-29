//
//  Forecast.swift
//  Weather
//
//  Created by Erid Bardhaj on 4/29/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit
import ObjectMapper

class Forecast: Mappable
{
    var m_weatherCondition: WeatherCondition = WeatherCondition.None
    var m_day: String = ""
    var m_degree: Double = 0.0
    
    
    required init?(_ map: Map)
    {
        mapping(map)
    }
    
    //MARK: - Mappable
    func mapping(map: Map)
    {
        m_weatherCondition    <- map["username"]
        m_day                 <- map["username"]
        m_degree              <- map["username"]
    }
}
