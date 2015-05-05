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
            return UIColor(red: 255/255, green: 136/255, blue: 71/255, alpha: 1)
        }
        
        class func whiteColor() -> UIColor
        {
            return UIColor.whiteColor()
        }
        
        class func notification_errorColor() -> UIColor
        {
            return UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        }
        
        class func yellowColor() -> UIColor
        {
            return UIColor(red: 255/255, green: 203/255, blue: 82/255, alpha: 1)
        }
    }
    
    class Defaults
    {
        class func appGroupName() -> String
        {
            return "group.weather.strv"
        }
    }
    
    class URLS
    {
        class func weatherBaseURL() -> String
        {
            return "http://api.openweathermap.org/data/2.5/"
        }
        
        class func autocompleteBaseURL() -> String
        {
            return "https://maps.googleapis.com/maps/api/place/autocomplete/json?&key=\(Constants.APIKeys.googleAutocompleteAPI())"
        }
        
        class func placeAutocompletionOpenWeather() -> String
        {
            return "http://api.openweathermap.org/data/2.5/find?type=like&mode=json&"
        }
    }
    
    class APIKeys
    {
        class func googleAutocompleteAPI() -> String
        {
            return "AIzaSyDlFUCllNZ_ZY1Irnn46F90yZPMBL4aB6s"
        }
    }
}
