//
//  ForecastInterfaceController.swift
//  Weather
//
//  Created by Erid Bardhaj on 5/4/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import WatchKit
import Foundation


class ForecastInterfaceController: WKInterfaceController
{
    
    //Outlets
    @IBOutlet weak var tableView: WKInterfaceTable!
    
    //Data Holder
    var dataArray:[Forecast] = []

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        //Set the controller title
        self.setTitle("Forecast")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        if self.dataArray.count == 0
        {
            //Load data from this app
            loadNetworkFromHere()
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    //MARK: - Setup Data
    func loadTable()
    {
        self.tableView.setNumberOfRows(dataArray.count, withRowType: "cell")
        
        var count = 0
        for forecast in dataArray
        {
            var row = self.tableView.rowControllerAtIndex(count) as! ForecastCell
            row.configureCell(forecast, index: count)
            count++
        }
    }
    
    func getContentFromMainApp(action: String)
    {
        let params = ["action": action]
        WKInterfaceController.openParentApplication(params, reply:
        {
            (replyInfo, error) -> Void in
            
            if (error != nil)
            {
                println(error.description)
            }
            else
            {
                var response: [NSObject : AnyObject] = replyInfo as [NSObject : AnyObject]
                self.dataArray = response["response"] as! [Forecast]
                
                dispatch_async(dispatch_get_main_queue(),
                    {
                        () -> Void in
                        self.loadTable()
                })
            }
        })
    }
    
    //Load content here creates the call of mainApp from here explicitely
    func loadNetworkFromHere()
    {
        //Make the call to API
        WeatherNetwork.getForecastWeatherByCoordinates(DataManager.shared.m_city_lat, lng: DataManager.shared.m_city_lng, responseHandler:
        {
                (error, array) -> (Void) in
                if error == ErrorType.None
                {
                    self.dataArray = array!
                    
                    dispatch_async(dispatch_get_main_queue(),
                        {
                            () -> Void in
                            self.loadTable()
                    })
                }
                else
                {
                    //Handle Error
                    println("Error")
                }
        })
    }
    
    //MARK: - Force Touch Actions
    @IBAction func forceTouchRefreshContent()
    {
        //Reload data
        loadNetworkFromHere()
    }
}
