//
//  CountyTableViewController.swift
//  finalProject
//
//  Created by Jordyn Romero on 12/4/16.
//  Copyright © 2016 Jordyn Romero. All rights reserved.
//

import UIKit
import Foundation

class CountyTableViewController: UITableViewController {
    
    @IBOutlet var countyTableView: UITableView!
    var countyList = [String]()
    
    func loadCounties(){
        countyList += ["Del Norte", "Humboldt", "Mendocino", "Sonoma", "Marin", "San Francisco", "San Mateo", "Santa Cruz", "Monterey", "San Luis Obispo", "Santa Barbara", "Ventura", "Los Angeles", "Orange County", "San Diego"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let countyNib = UINib(nibName: "CountyCell", bundle: nil)
        
        self.countyTableView.register(countyNib, forCellReuseIdentifier: "county_cell")
        
        loadCounties()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return  countyList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let county = countyList[indexPath.row]
        
        let cell = self.countyTableView.dequeueReusableCell(withIdentifier: "county_cell") as! CountyCell
        cell.populate(county: county, navController: self.navigationController!)
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let countyVC = storyboard.instantiateViewController(withIdentifier: "beach") as! BeachTableViewController
        
        countyVC.county = countyList[indexPath.row]//county at that position
        
        self.navigationController!.pushViewController(countyVC, animated: true)
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.countyTableView.reloadData()
        loadCounties()
    }
    
    
}
    


        

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        /*
        let spotName = self.beach!.spot_name

        
        let fullURL = "http://api.spitcast.com/api/spot/all"
        
        let url = URL(string: fullURL)!
        
        let beachTask = URLSession.shared.dataTask(with: url){ (data, response, error) in
            
            if let e = error
            {
                print(e)//show error on screen when you have more time
                return
            }
            print(data)
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
            
            let beachDict = json as! [String: AnyObject]
            
            let temp = beachDict["
        }
        
        beachTask.resume()
        
        let beachDict = JSONSerialization.*/
        





















