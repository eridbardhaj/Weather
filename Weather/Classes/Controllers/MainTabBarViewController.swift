//
//  MainTabBarViewController.swift
//  Weather
//
//  Created by Erid Bardhaj on 5/3/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController
{
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.changeTabBarItems()
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        //Keep original image not gray default
        changeTabBarItems()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Configuration
    func changeTabBarItems()
    {
        var imageNames = ["tod-sun", "tod-forecast", "tod-settings"]
        var count = 0
        for imageName in imageNames
        {
            var m_tabBarItem: UITabBarItem = self.tabBar.items![count] as! UITabBarItem
            var image = UIImage(named: imageName)
            
            m_tabBarItem.image = image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            
            count++
        }
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
