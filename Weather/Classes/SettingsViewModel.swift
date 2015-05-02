//
//  SettingsViewModel.swift
//  Weather
//
//  Created by Erid Bardhaj on 5/2/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

class SettingsViewModel: NSObject
{
    var m_unit: String = ""
    var m_currentValue: String = ""
    
    init(model: Setting)
    {
        m_unit = model.m_unit
        m_currentValue = (model.m_unitType == UnitType.Temperature) ? TemperatureUnit(rawValue: model.m_currentValue)!.description : WindSpeedUnit(rawValue: model.m_currentValue)!.description
    }
}
