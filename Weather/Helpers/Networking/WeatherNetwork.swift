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
    class func getCurrentWeatherByName(city: String, responseHandler: (ErrorType, Weather?) -> (Void))
    {
        //Create URL String
        let urlString = "\(Constants.URLS.weatherBaseURL())weather?q=\(city)&units=metric"
        
        //Encode string to avoid escapes
        let encodedURL = urlString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        
        //Make Request and return callback
        self.makeRequest(encodedURL!, responseCallBack:
        {
            (error, object) -> (Void) in
            
            if (!error)
            {
                if let weather = Mapper<Weather>().map(object)
                {
                    responseHandler(ErrorType.None, weather)
                }
                else
                {
                    responseHandler(ErrorType.Server, nil)
                }
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
        
        //Encode string to avoid escapes
        let encodedURL = urlString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        
        //Make Request and return callback
        self.makeRequest(encodedURL!, responseCallBack:
            {
                (error, object) -> (Void) in
                
                if (!error)
                {
                    if let weather = Mapper<Weather>().map(object)
                    {
                        responseHandler(ErrorType.None, weather)
                    }
                    else
                    {
                        responseHandler(ErrorType.Server, nil)
                    }
                }
                else
                {
                    responseHandler(ErrorType.Server, nil)
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
        let urlString = "\(Constants.URLS.weatherBaseURL())forecast/daily?q=\(city)&units=metric&cnt=7"
        
        //Encode string to avoid escapes
        let encodedURL = urlString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        
        //Make Request and return callback
        self.makeRequest(encodedURL!, responseCallBack:
            {
                (error, object) -> (Void) in
                
                if (!error)
                {
                    if let lists: [AnyObject] = object!["list"] as? [AnyObject]
                    {
                        let forecast: Array<Forecast> = Mapper<Forecast>().mapArray(lists)!
                        responseHandler(ErrorType.None, forecast)
                    }
                    else
                    {
                        responseHandler(ErrorType.None, [])
                    }
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
        let urlString = "\(Constants.URLS.weatherBaseURL())forecast/daily?lat=\(lat)&lon=\(lng)&units=metric&cnt=7"
        
        //Encode string to avoid escapes
        let encodedURL = urlString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        
        //Make Request and return callback
        self.makeRequest(encodedURL!, responseCallBack:
            {
                (error, object) -> (Void) in
                
                if (!error)
                {
                    if let lists: [AnyObject] = object!["list"] as? [AnyObject]
                    {
                        let forecast: Array<Forecast> = Mapper<Forecast>().mapArray(lists)!
                        responseHandler(ErrorType.None, forecast)
                    }
                    else
                    {
                        responseHandler(ErrorType.None, [])
                    }
                }
                else
                {
                    responseHandler(ErrorType.Server, [])
                }
        })
    }
    
    //MARK: - Helpers
    //Universal caller
    private class func makeRequest(urlString: String, responseCallBack: (Bool, AnyObject?) -> (Void))
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
                responseCallBack(true, object)
            }
        }
    }
    
    
}
