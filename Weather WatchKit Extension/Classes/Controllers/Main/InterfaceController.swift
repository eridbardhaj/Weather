//
//  InterfaceController.swift
//  Weather WatchKit Extension
//
//  Created by Erid Bardhaj on 5/4/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController
{
    
    //Outlets
    @IBOutlet weak var m_currenLocation: WKInterfaceLabel!
    @IBOutlet weak var m_weatherIcon: WKInterfaceImage!
    @IBOutlet weak var m_weatherCondition: WKInterfaceLabel!
    @IBOutlet weak var m_weatherTemp: WKInterfaceLabel!
    
    //Holder
    var wModel: Weather?
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        //Set the controller title
        self.setTitle("Today")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        //Load network request to download data
        if wModel == nil
        {
            self.loadData()
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    //MARK: - Setups
    func loadData()
    {
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
                            self.wModel = object
                            self.bindDataToViews(self.wModel!)
                    })
                }
                else
                {
                    //Handle Error
                    println("Error")
                }
        })
    }
    
    func bindDataToViews(model: Weather)
    {
        let vModel = TodayViewModel(model: model)
        
        self.m_currenLocation.setText(vModel.m_currentLocation)
        self.m_weatherCondition.setText(vModel.m_weatherCondition)
        self.m_weatherIcon.setImage(UIImage(named: vModel.m_weatherImageName))
        self.m_weatherTemp.setText(vModel.m_temp)
    }

    //MARK: - Force Touch Actions
    @IBAction func forceTouchRefreshContent()
    {
        //Reload data
        loadData()
    }
}
