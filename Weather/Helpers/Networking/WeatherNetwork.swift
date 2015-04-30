//
//  WeatherNetwork.swift
//  Weather
//
//  Created by Erid Bardhaj on 4/29/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class WeatherNetwork: NSObject
{
    //MARK: - Current Weather Calls
    /**
    Get current weather by city name
    
    :param: city            City that you want to look up for
    :param: responseHandler Closure that returns errortype and the object that was received by the API
    */
    class func getCurrentWeatherByName(city: String, responseHandler: (ErrorType, AnyObject?) -> (Void))
    {
        //Create URL String
        let urlString = "\(Constants.URLS.weatherBaseURL())weather?q=\(city)APPID=9d8140ec7e949399dee6b61b5607db20"
        
        //Make Request and return callback
        self.makeRequest(urlString, responseCallBack:
        {
            (error, object) -> (Void) in
            
            if (!error)
            {
                let weather = Mapper<Weather>().map(object)
                
                responseHandler(ErrorType.None, weather!)
            }
            else
            {
                responseHandler(ErrorType.Server, nil)
            }
        })
    }
    
    /**
    Get current weather by Location Coordinates
    
    :param: lat             Latitude of your location
    :param: lng             Longitude of your location
    :param: responseHandler Closure that returns errortype and the object that was received by the API
    */
    class func getCurrentWeatherByCoordinates(lat: Double, lng: Double, responseHandler: (ErrorType, AnyObject?) -> (Void))
    {
        //Create URL String
        let urlString = "\(Constants.URLS.weatherBaseURL())weather?lat=\(lat)&lon=\(lng)"
        
        //Make Request and return callback
        self.makeRequest(urlString, responseCallBack:
            {
                (error, object) -> (Void) in
                
                if (!error)
                {
                    responseHandler(ErrorType.None, object)
                }
                else
                {
                    responseHandler(ErrorType.Server, object)
                }
        })
    }
    
    //MARK: - Forecast Calls
    /**
    Get forecast weather data for one location by searching with a city name
    
    :param: city            City that you want to look up for
    :param: responseHandler Closure that returns errortype and the object that was received by the API
    */
    class func getForecastWeatherByName(city: String, responseHandler: (ErrorType, Array<Forecast>) -> (Void))
    {
        //Create URL String
        let urlString = "\(Constants.URLS.weatherBaseURL())forecast?q=\(city)"
        
        //Make Request and return callback
        self.makeRequest(urlString, responseCallBack:
            {
                (error, object) -> (Void) in
                
                if (!error)
                {
                    if let lists: [AnyObject] = object["list"] as? [AnyObject]
                    {
                        let forecast: Array<Forecast> = Mapper<Forecast>().mapArray(lists)!
                        responseHandler(ErrorType.None, forecast)
                    }
                    responseHandler(ErrorType.None, [])
                    
                }
                else
                {
                    responseHandler(ErrorType.Server, [])
                }
        })
    }
    
    /**
    Get forecast weather data for one location by searching with coordinates
    
    :param: lat             Latitude of your location
    :param: lng             Longitude of your location
    :param: responseHandler Closure that returns errortype and the object that was received by the API
    */
    class func getForecastWeatherByCoordinates(lat: Double, lng: Double, responseHandler: (ErrorType, AnyObject?) -> (Void))
    {
        //Create URL String
        let urlString = "\(Constants.URLS.weatherBaseURL())forecast?lat=\(lat)&lon=\(lng)"
        
        //Make Request and return callback
        self.makeRequest(urlString, responseCallBack:
        {
                (error, object) -> (Void) in
                
                if (!error)
                {
                    responseHandler(ErrorType.None, object)
                }
                else
                {
                    responseHandler(ErrorType.Server, object)
                }
        })
    }
    
    //MARK: - Helpers
    //Universal caller
    private class func makeRequest(urlString: String, responseCallBack: (Bool, AnyObject) -> (Void))
    {
        Alamofire.request(.GET, urlString, parameters: nil).responseJSON(options: NSJSONReadingOptions.AllowFragments)
        {
            (urlRequest, urlResponse, object, error) -> Void in
            
            if (error == nil)
            {
                responseCallBack(false, object!)
            }
            else
            {
                responseCallBack(true, object!)
            }
        }
    }
    
    
}
