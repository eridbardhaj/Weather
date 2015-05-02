//
//  SettingsViewController.swift
//  Weather
//
//  Created by Erid Bardhaj on 4/29/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    //TableView
    @IBOutlet weak var tableView: UITableView!
    
    //Data holder
    var dataArray: Array<Setting> = Array()
    
    //iVars
    private var m_unitType: UnitType?
    private var m_allValues: [Int]?
    private var m_currentValue: Int?
    private var m_chooseVCTitle: String?
    
    //MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //Config tableView insets
        ConfigUtils.configureTableView(self.tableView)
        
        //Load data
        loadData()
        
        //Add observer to listen to possible changes on loadData
        DataManager.shared.createObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool)
    {
        self.tableView.reloadData()
    }
    
    //MARK: - Setups
    func loadData()
    {
        dataArray = DataManager.shared.getSettings()
        self.tableView.reloadData()
    }
    
    //MARK: - UITableView Delegate and Datasource methods
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //Dequeue our ForecastTableViewCell
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SettingsTableViewCell
        
        //Get current model
        let model = dataArray[indexPath.row] as Setting
        
        //Configure cell
        cell.configureCell(model, indexPath: indexPath, dataCount: dataArray.count)
        
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        //Pass current cell values to iVar to get ready to navigate to the next level
        prepareData(indexPath.row)
        
        //Trigger pushing to the next vc
        self.performSegueWithIdentifier(SegueControllerID.ChooseUnit.description, sender: nil)
        
        //Deselect row
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //MARK: - Utils
    //Set data ready for the other side
    private func prepareData(index: Int)
    {
        //Read model from the content holder array
        let s_model = dataArray[index] as Setting
        
        //Spread it into iVars
        m_allValues = s_model.m_allValues
        m_unitType = s_model.m_unitType
        m_currentValue = s_model.m_currentValue
        m_chooseVCTitle = (m_unitType == UnitType.Length) ? "Length" : "Temperature"
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == SegueControllerID.ChooseUnit.description
        {
            // Get the new view controller using segue.destinationViewController.
            var controller = segue.destinationViewController as! ChooseUnitViewController
            
            // Pass the selected object to the new view controller.
            controller.m_currentIndex = m_currentValue!
            controller.m_unitType = m_unitType!
            controller.dataArray = m_allValues!
            controller.title = m_chooseVCTitle
        }
    }

}
