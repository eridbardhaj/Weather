//
//  ConfigUtils.swift
//  Weather
//
//  Created by Erid Bardhaj on 5/2/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

class ConfigUtils: NSObject
{
    /**
    Configure tableViewInsets to avoid hiding content from the TabBar
    
    :param: tableView tableView you want to configure
    */
    class func configureTableView(tableView: UITableView)
    {
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
    }
}
