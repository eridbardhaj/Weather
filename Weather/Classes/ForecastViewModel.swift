//
//  ForecastViewModel.swift
//  Weather
//
//  Created by Erid Bardhaj on 30/04/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

class ForecastViewModel: NSObject
{
    var m_weatherIconName: String = ""
    var m_day: String = ""
    var m_weatherCondition: String = ""
    var m_degree: String = ""
    
    init(model: Forecast)
    {
        m_weatherIconName = ValueTransformUtil.getWeatherIconName(ValueTransformUtil.getWeatherCondition(model.m_weatherType))
        m_day = ValueTransformUtil.getDayName(model.m_day)
        m_weatherCondition = model.m_weatherDescription
        
        //FIXME: Orientation based on Angle, this is hardcoded
        m_degree = "SE"
    }
    
    
}
