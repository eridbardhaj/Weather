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
    var m_temperature: Double = 0.0
    var m_day: Int = 0
    var m_weatherType: Int = 0
    
    
    required init?(_ map: Map)
    {
        mapping(map)
    }
    
    func mapping(map: Map)
    {
        let list = map["list"]
        var m_weatherArr1: NSArray = NSArray()
        m_weatherArr1 <- list["weather"]
        
        m_weatherType = m_weatherArr1[0].objectForKey("id") as! Int
        m_temperature    <- list["main.temp"]
        m_day            <- list["dt"]
    }
    
}