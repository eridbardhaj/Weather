//
//  ForecastTableViewCell.swift
//  Weather
//
//  Created by Erid Bardhaj on 4/29/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell
{
    //MARK: - IBOutlets
    @IBOutlet weak var m_weatherIcon: UIImageView!
    @IBOutlet weak var m_day: UILabel!
    @IBOutlet weak var m_weatherCondition: UILabel!
    @IBOutlet weak var m_degree: UILabel!
    
    //MARK: - UITableViewCell Inherited Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Cell Configuration
    func configureCell(index: NSIndexPath, model: Forecast)
    {
        //Using MVVM pattern to reduce code here
        var forecastVModel = ForecastViewModel(model: model)
        
        self.m_weatherIcon.image = UIImage(named: forecastVModel.m_weatherIconName)
        self.m_day.text = forecastVModel.m_day
        self.m_weatherCondition.text = forecastVModel.m_weatherCondition
        self.m_degree.text = forecastVModel.m_degree
    }

}
