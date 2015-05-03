//
//  TodayDetailsViewController.swift
//  Weather
//
//  Created by Erid Bardhaj on 4/27/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController
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
    var model: Weather?
    
    //MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Get data from server API and load into the view
        loadData()
        
        //Add observer to listen to possible changes on loadData
        DataManager.shared.createObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Setups
    func loadData()
    {
        //Ask for the current coordinates
        LocationManager.shared.getCurrentLocation()
        
        //Make the call to API
        WeatherNetwork.getCurrentWeatherByCoordinates(DataManager.shared.m_city_lat, lng: DataManager.shared.m_city_lng, responseHandler:
        {
            (error, object) -> (Void) in
            
            //No Error just show content
            if error == ErrorType.None
            {
                dispatch_async(dispatch_get_main_queue(),
                {
                    () -> Void in
                        
                    self.model = object
                    self.bindDataIntoViews()
                })
            }
            else
            {
                //Handle Error
            }
        })
    }
    
    func bindDataIntoViews()
    {
        //Init viewModel
        var v_model: TodayViewModel = TodayViewModel(model: model!)
        
        //Pass the model to the views
        m_weatherIcon.image = UIImage(named: v_model.m_weatherImageName)
        m_currentLocation.text = v_model.m_currentLocation
        m_currentWeatherInfo.text = v_model.m_currentWeatherInfo
        m_humidityPercentage.text = v_model.m_humidity
        m_precipitation.text = v_model.m_precipitation
        m_pressure.text = v_model.m_pressure
        m_windSpeed.text = v_model.m_windSpeed
        m_windDirection.text = v_model.m_directionAngle
    }
    
    
    //MARK: - IBActions
    //Show native iOS Sharing Dialog
    @IBAction func shareCurrentInfo(sender: AnyObject)
    {
        
    }

    @IBAction func refreshTodayWeather(sender: AnyObject)
    {
        loadData()
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
