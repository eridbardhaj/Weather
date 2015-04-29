//
//  Constants.swift
//  Weather
//
//  Created by Erid Bardhaj on 4/27/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

class Constants: NSObject
{
    class Colors
    {
        class func blackColor() -> UIColor
        {
            return UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        }
        
        class func lightBlue() -> UIColor
        {
            return UIColor(red: 47/255, green: 145/255, blue: 255/255, alpha: 1)
        }
        
        class func orangeColor() -> UIColor
        {
            return UIColor(red: 47/255, green: 136/255, blue: 71/255, alpha: 1)
        }
        
        class func whiteColor() -> UIColor
        {
            return UIColor.whiteColor()
        }
    }
    
    class Defaults
    {
        class func appGroupName() -> String
        {
            return "com.strv"
        }
    }
}
