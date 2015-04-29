//
//  WeatherNetwork.swift
//  Weather
//
//  Created by Erid Bardhaj on 4/29/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit
import Alamofire

class WeatherNetwork: NSObject
{
    
    class func getCurrentWeatherByName(city: String, response: (Bool, AnyObject) -> (Void))
    {
        //Create URL String
        let urlString = "\(Constants.URLS.weatherBaseURL())q=\(city)"
        
        //Make Request and return callback
        self.makeRequest(urlString, responseCallBack:
        {
            (error, object) -> (Void) in
            
        })
    }
    
    
    //Universal caller
    class func makeRequest(urlString: String, responseCallBack: (Bool, AnyObject) -> (Void))
    {
        Alamofire.request(.GET, urlString, parameters: nil)
            .response
            {
                (request, response, data, error) in
                
                if (error != nil)
                {
                    responseCallBack(false, data!)
                }
                else
                {
                    responseCallBack(true, data!)
                }
        }
    }
    
    
}
