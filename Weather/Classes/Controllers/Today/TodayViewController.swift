//
//  TodayDetailsViewController.swift
//  Weather
//
//  Created by Erid Bardhaj on 4/27/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController, EBPullToRefreshDelegate
{
    //MARK: - IBOutlets
    @IBOutlet weak var m_scrollView: UIScrollView!
    @IBOutlet weak var m_weatherIcon: UIImageView!
    @IBOutlet weak var m_currentLocation: UILabel!
    @IBOutlet weak var m_currentWeatherInfo: UILabel!
    @IBOutlet weak var m_humidityPercentage: UILabel!
    @IBOutlet weak var m_precipitation: UILabel!
    @IBOutlet weak var m_pressure: UILabel!
    @IBOutlet weak var m_windSpeed: UILabel!
    @IBOutlet weak var m_windDirection: UILabel!
    
    //PulltoRefresh
    var pull2Refresh: CustomPullToRefresh = CustomPullToRefresh()
    
    //MARK: - Properties
    var model: Weather?
    
    //MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Configure pull to refresh
        configurePullToRefresh()
        
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
                    DataManager.shared.m_city = self.model!.m_city
                    self.bindDataIntoViews()
                })
            }
            else
            {
                //Handle Error
                AlertManager.showAlertNotification(error.description, parentController: self)
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
    
    func configurePullToRefresh()
    {
        // Do any additional setup after loading the view, typically from a nib.
        m_scrollView.contentInset = UIEdgeInsetsZero
        m_scrollView.contentSize = CGSize(width: 0, height: self.m_scrollView.bounds.height+50)
        
        //Init Delegate
        pull2Refresh.pullDelegate = self
        
        //Add Pull to refresh
        pull2Refresh.setupRefreshControl(m_scrollView)
    }
    
    
    //MARK: - IBActions
    //Show native iOS Sharing Dialog
    @IBAction func shareCurrentInfo(sender: AnyObject)
    {
        let shareURL = "http://www.strv.com/"
        
        let activityItems: [AnyObject] = [NSURL(string: shareURL)!]
        let applicationActivities: [AnyObject]? = nil
        let excludeActivities = [UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypePostToWeibo, UIActivityTypePrint, UIActivityTypeMessage]
        
        var activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        activityController.excludedActivityTypes = excludeActivities
        
        self.presentViewController(activityController, animated: true, completion: nil)
        
        if activityController.respondsToSelector("popoverPresentationController")
        {
            var popOver = activityController.popoverPresentationController
            
            popOver?.sourceView = sender as! UIButton
        }
    }

    @IBAction func refreshTodayWeather(sender: AnyObject)
    {
        loadData()
    }
    
    //MARK: - EBPullToRefreshDelegate
    func pullToRefreshTriggered()
    {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.loadData()
        })
    }

}
