//
//  ForecastCell.swift
//  Weather
//
//  Created by Erid Bardhaj on 5/4/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit
import WatchKit

class ForecastCell: NSObject
{
    @IBOutlet weak var m_day: WKInterfaceLabel!
    @IBOutlet weak var m_weatherIcon: WKInterfaceImage!
    @IBOutlet weak var m_temperature: WKInterfaceLabel!
    @IBOutlet weak var m_weatherCondition: WKInterfaceLabel!
    
    
    func configureCell(model: Forecast, index: Int)
    {
        let vModel = ForecastViewModel(model: model)
        
        self.m_day.setText(vModel.m_day)
        self.m_temperature.setText(vModel.m_temperature)
        self.m_weatherIcon.setImage(UIImage(named: vModel.m_weatherIconName))
        self.m_weatherCondition.setText(vModel.m_weatherCondition)
    }
}
