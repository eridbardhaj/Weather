//
//  ForecastViewController.swift
//  Weather
//
//  Created by Erid Bardhaj on 4/29/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EBPullToRefreshDelegate
{
    var dataArray: [Forecast] = []    //Array which hold our forecast models
    @IBOutlet weak var tableView: UITableView!
    
    //PulltoRefresh
    var pull2Refresh: CustomPullToRefresh = CustomPullToRefresh()

    //MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configure tableView insets
        ConfigUtils.configureTableView(self.tableView)
        
        //Configure PullToRefresh
        configurePullToRefresh()
        
        //Call API and get Results
        loadData()
        
        //Add observer to listen to possible changes on loadData
        DataManager.shared.createObserver(self)
        
        //Adding title
        self.title = DataManager.shared.m_city
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        //Adding title
        self.title = DataManager.shared.m_city
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
        WeatherNetwork.getForecastWeatherByCoordinates(DataManager.shared.m_city_lat, lng: DataManager.shared.m_city_lng, responseHandler:
        {
            (error, array) -> (Void) in
            if error == ErrorType.None
            {
                dispatch_async(dispatch_get_main_queue(),
                {
                    () -> Void in
                    self.dataArray = array!
                    self.tableView.reloadData()
                })
            }
            else
            {
                //Handle Error
                AlertManager.showAlertNotification(error.description, parentController: self)
            }
        })
    }
    
    func configurePullToRefresh()
    {
        //Init Delegate
        pull2Refresh.pullDelegate = self
        
        //Add Pull to refresh
        pull2Refresh.setupRefreshControl(self.tableView)
    }
    
    //MARK: - UITableView Delegate and Datasource methods
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //Dequeue our ForecastTableViewCell
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ForecastTableViewCell
        
        //Load Forecast model
        let model = dataArray[indexPath.row] as Forecast
        
        //Configure this cell by giving his corresponding model
        cell.configureCell(indexPath, model: model)
        
        //return cell to the datasource
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataArray.count
    }
    
    //MARK: - IBActions
    @IBAction func refreshForecastWeather(sender: AnyObject)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
