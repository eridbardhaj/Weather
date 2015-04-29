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
        
    }

}
