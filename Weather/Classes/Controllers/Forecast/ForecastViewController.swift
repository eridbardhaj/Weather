//
//  ForecastViewController.swift
//  Weather
//
//  Created by Erid Bardhaj on 4/29/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var dataArray: Array<Forecast> = Array()    //Array which hold our forecast models
    @IBOutlet weak var tableView: UITableView!

    //MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        WeatherNetwork.getForecastWeatherByName("London", responseHandler:
        {
            (error, array) -> (Void) in
            if error == ErrorType.None
            {
                self.dataArray = array
                self.tableView.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return self.dataArray.count
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
