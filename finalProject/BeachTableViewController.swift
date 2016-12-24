//
//  BeachTableViewController.swift
//  finalProject
//
//  Created by Jordyn Romero on 12/11/16.
//  Copyright © 2016 Jordyn Romero. All rights reserved.
//

import UIKit

class BeachTableViewController: UITableViewController {
    
    @IBOutlet var beachTableView: UITableView!
    var beachList = [String]()
    var spotIDList = [Int]()
    
    var county : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getBeaches()
        
        let beachNib = UINib(nibName: "BeachCell", bundle: nil)
        
        self.beachTableView.register(beachNib, forCellReuseIdentifier: "beach_cell")

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return beachList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let beach = beachList[indexPath.row]
        let spotID = spotIDList[indexPath.row]
        
        let cell = self.beachTableView.dequeueReusableCell(withIdentifier: "beach_cell") as! BeachCell
        cell.populate(beach: beach, spotID: spotID, navController: self.navigationController!)

        cell.titleLabel.text = beach
        

        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let beachVC = storyboard.instantiateViewController(withIdentifier: "conditions") as! ConditionsViewController
        
        beachVC.beach = beachList[indexPath.row]//beach at that position
        
        beachVC.spotID = spotIDList[indexPath.row]
            
        self.navigationController!.pushViewController(beachVC, animated: true)
        /*
        let county = self.county
        let destinationVC = BeachTableViewController()
        destinationVC.county = county
        destinationVC.performSegue(withIdentifier: "segueToConditions", sender: self)*/
        }
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.beachTableView.reloadData()
        getBeaches()
        
        }

    private func getBeaches(){
        
        let baseUrl = "http://api.spitcast.com/api"
        let method = "/spot/all"
        
        let fullUrl = "\(baseUrl)\(method)"
        let url = URL(string: fullUrl)!
        
        let beachTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let e = error
            {
                print("error: ", e)
                return
            }
            
            let json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            
            var beachDict = json as! [[String : AnyObject]]
            
            for i in 0 ..< beachDict.count
            {
                let countyList = [(beachDict[i]["county_name"] as! String)]
                
                for county in countyList{
                    
                    if county == self.county{
                        
                        self.beachList += [(beachDict[i]["spot_name"] as! String)]
                        self.spotIDList += [(beachDict[i]["spot_id"] as! Int)]
                        }
                }
            }
        }
        beachTask.resume()
    }
    

}











