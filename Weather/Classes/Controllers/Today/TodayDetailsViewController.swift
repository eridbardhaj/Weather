//
//  TodayDetailsViewController.swift
//  Weather
//
//  Created by Erid Bardhaj on 4/27/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

class TodayDetailsViewController: UIViewController
{
    //MARK: - IBOutlets
    @IBOutlet weak var m_weatherIcon: UIImageView!
    @IBOutlet weak var m_currentLocation: UILabel!
    @IBOutlet weak var m_currentWeatherInfo: UILabel!
    @IBOutlet weak var m_humidityPercentage: UILabel!
    @IBOutlet weak var m_precipitation: UILabel!
    @IBOutlet weak var m_pressure: UILabel!
    @IBOutlet weak var m_windSpeed: UILabel!
    @IBOutlet weak var m_windDirection: UILabel!
    
    //MARK: - Properties
    var model: Weather = Weather()
    
    //MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        WeatherNetwork.getForecastWeatherByName("London", responseHandler:
        {
            (error, forecasts) -> (Void) in
            
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Setups
    func bindDataIntoViews()
    {
        
    }
    
    
    //MARK: - IBActions
    //Show native iOS Sharing Dialog
    @IBAction func shareCurrentInfo(sender: AnyObject)
    {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
