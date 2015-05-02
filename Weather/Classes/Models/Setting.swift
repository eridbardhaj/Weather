//
//  Setting.swift
//  Weather
//
//  Created by Erid Bardhaj on 5/2/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

class Setting: NSObject
{
    var m_unitType: UnitType = UnitType(rawValue: 0)!
    var m_unit: String = ""
    var m_currentValue: Int = 0
    var m_allValues: [Int] = []
    
    init(unit: String, currentValue: Int, allValues: [Int], unitType: UnitType)
    {
        m_unitType = unitType
        m_unit = unit
        m_currentValue = currentValue
        m_allValues = allValues
    }
}
