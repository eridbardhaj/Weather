//
//  NotificationController.swift
//  Weather WatchKit Extension
//
//  Created by Erid Bardhaj on 5/4/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import WatchKit
import Foundation


class NotificationController: WKUserNotificationInterfaceController
{
    //Outlets
    @IBOutlet weak var m_location: WKInterfaceLabel!
    @IBOutlet weak var m_weatherIcon: WKInterfaceImage!
    @IBOutlet weak var m_weatherCondition: WKInterfaceLabel!
    @IBOutlet weak var m_temperature: WKInterfaceLabel!
    
    //Holder
    var wModel: Weather?
    

    override init() {
        // Initialize variables here.
        super.init()
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        //
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    //MARK: - Setup
    func bindDataToViews(model: Weather)
    {
        var vModel = TodayViewModel(model: model)
        
        self.m_location.setText(vModel.m_currentLocation)
        self.m_weatherIcon.setImage(UIImage(named: vModel.m_weatherImageName))
        
        self.m_weatherCondition.setText(vModel.m_weatherCondition)
        self.m_temperature.setText(vModel.m_temp)
    }
    
    //MARK: - Handling notifications

    /*
    override func didReceiveLocalNotification(localNotification: UILocalNotification, withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        // This method is called when a local notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        completionHandler(.Custom)
    }
    */
    
    override func didReceiveRemoteNotification(remoteNotification: [NSObject : AnyObject], withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void))
    {
        // This method is called when a remote notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        wModel = Weather(city: DataManager.shared.m_city, state: "", temp: 12.0, wCondition: "Sunny", mWeatherCode: 800)
        
        self.bindDataToViews(wModel!)
        
        completionHandler(.Custom)
    }
    
}
