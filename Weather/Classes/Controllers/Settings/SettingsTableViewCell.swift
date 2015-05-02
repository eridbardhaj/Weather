//
//  SettingsTableViewCell.swift
//  Weather
//
//  Created by Erid Bardhaj on 5/2/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell
{
    //IBOutlets
    @IBOutlet weak var m_nameOfUnit: UILabel!
    @IBOutlet weak var m_unitValue: UILabel!
    
    //Show or hide depending on the case
    @IBOutlet weak var m_dividerTop: UIImageView!
    @IBOutlet weak var m_dividerMid: UIImageView!
    @IBOutlet weak var m_dividerBottom: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //Cell Configuration
    func configureCell(model: Setting, indexPath: NSIndexPath, dataCount: Int)
    {
        //Creating viewModel of Settings
        var v_model = SettingsViewModel(model: model)
        
        //Binding values to views
        self.m_nameOfUnit.text = v_model.m_unit
        self.m_unitValue.text = v_model.m_currentValue
        
        self.showDividers(indexPath.row, count: dataCount)
    }
    
    //Show hidden dividers
    func showDividers(index: Int, count: Int)
    {
        if index == 0
        {
            self.m_dividerTop.hidden = false
            self.m_dividerMid.hidden = false
        }
        else if index < count-1
        {
            self.m_dividerMid.hidden = false
        }
        else
        {
            self.m_dividerBottom.hidden = false
        }
    }

}
