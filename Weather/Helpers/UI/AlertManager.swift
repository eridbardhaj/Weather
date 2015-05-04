//
//  AlertManager.swift
//  Weather
//
//  Created by Erid Bardhaj on 5/3/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

class AlertManager: NSObject
{
    /**
    Create a notification in red color to indicate that something wrong has gone
    
    :param: title            title of the error
    :param: parentController controller when we will show this notification
    */
    class func showAlertNotification(title: String, parentController: UIViewController)
    {
        //If we have an active view, skip the loading of another one
        if isViewActive(parentController)
        {
            return
        }
        
        //Get width and height for this notification
        let nWidth: Double = Double(parentController.view.frame.width)
        let nHeight: Double = 50.0
        
        //Create frame for notification
        let nFrame = CGRect(x: 0.0, y: 66.0, width: nWidth, height: nHeight)
        
        //Create notification
        var notifyView = SFSwiftNotification(frame: nFrame,
            title: title,
            animationType: AnimationType.AnimationTypeBounce,
            direction: Direction.TopToBottom,
            delegate: nil)
        
        //Customize it
        notifyView.backgroundColor = Constants.Colors.notification_errorColor()
        notifyView.label.textColor = UIColor.whiteColor()
        notifyView.label.text = title
        notifyView.label.font = UIFont(name: "ProximaNova-Regular", size: 18.0)
        
        //Add it where its required
        parentController.view.addSubview(notifyView)
        
        //Show it with animation
        notifyView.animate(nFrame, delay:5)
    }
    
    //Utils to check if the view has already been added to controller
    class func isViewActive(controller: UIViewController) -> Bool
    {
        for view in controller.view.subviews
        {
            if view.isKindOfClass(SFSwiftNotification)
            {
                return true
            }
        }
        return false
    }
}
