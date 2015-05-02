//
//  ChooseUnitViewController.swift
//  Weather
//
//  Created by Erid Bardhaj on 5/2/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

class ChooseUnitViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    //TableView
    @IBOutlet weak var tableView: UITableView!
    
    //Properties passed by the other side
    var dataArray: Array<Int> = Array()
    var m_unitType: UnitType = UnitType.None
    var m_currentIndex: Int = 0
    
    //MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Config tableView insets
        ConfigUtils.configureTableView(self.tableView)
        
        //Load data
        loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Setups
    func loadData()
    {
        self.tableView.reloadData()
    }
    
    //MARK: - UITableView Delegate and Datasource methods
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //Dequeue our ForecastTableViewCell
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        //Get content
        let m_rawValue = dataArray[indexPath.row] as Int
        let text: String? = (m_unitType == UnitType.Length) ? WindSpeedUnit(rawValue: m_rawValue)?.description : TemperatureUnit(rawValue: m_rawValue)?.description
        
        //Pass it to the view
        cell.textLabel?.text = text
        cell.accessoryType = (m_currentIndex == indexPath.row) ? UITableViewCellAccessoryType.Checkmark : UITableViewCellAccessoryType.None
        
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
    
    //Depending on selection we save a iVar (m_currentIndex)
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        //Deselect last cell
        var cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: m_currentIndex, inSection: 0))
        cell?.accessoryType = UITableViewCellAccessoryType.None
        
        //Select current cell
        cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
        
        //Pass the current index
        m_currentIndex = indexPath.row
        
        //Deselect table at specific row
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //MARK: - IBActions
    @IBAction func changeUnitAction(sender: AnyObject)
    {
        //Notify changes to other controllers
        if (m_unitType == UnitType.Length)
        {
            DataManager.shared.m_length_unit = WindSpeedUnit(rawValue: m_currentIndex)!
            NSNotificationCenter.defaultCenter().postNotificationName(ObserverType.Settings.description, object: nil)
        }
        else if (m_unitType == UnitType.Temperature)
        {
            DataManager.shared.m_tempUnit = TemperatureUnit(rawValue: m_currentIndex)!
            NSNotificationCenter.defaultCenter().postNotificationName(ObserverType.Settings.description, object: nil)
        }
        
        //Pop this controller from stack
        self.navigationController?.popViewControllerAnimated(true)
    }
}
