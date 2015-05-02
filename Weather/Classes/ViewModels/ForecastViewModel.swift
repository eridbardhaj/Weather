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
    var m_temperature: String = ""
    
    init(model: Forecast)
    {
        //Local preferences
        let current_tempType = DataManager.shared.m_tempUnit
        m_weatherIconName = ValueTransformUtil.getWeatherCondition(model.m_weatherType).forecastIconName
        m_day = ValueTransformUtil.getDayName(model.m_day)
        m_weatherCondition = model.m_weatherDescription
        m_temperature = String(format: "%.0f", current_tempType.getDegree(model.m_temperature)) + "°"
    }
}
