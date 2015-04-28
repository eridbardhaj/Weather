//
//  SettingsViewController.swift
//  Weather
//
//  Created by Erid Bardhaj on 4/29/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController
{
    var dataArray: Array<String> = Array()
    
    //MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Setups
    func loadData()
    {
        dataArray = ["Unit of length", "Units of temperature"];
    }
    
    //MARK: - UITableView Delegate and Datasource methods
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //Dequeue our ForecastTableViewCell
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ForecastTableViewCell
        
        //Load Forecast model
        let text = dataArray[indexPath.row] as String
        
        //Show the text
        cell.textLabel?.text = text
        cell.detailTextLabel?.text = text
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
