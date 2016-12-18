//
//  ConditionsViewController.swift
//  finalProject
//
//  Created by Jordyn Romero on 12/17/16.
//  Copyright © 2016 Jordyn Romero. All rights reserved.
//

import UIKit

class ConditionsViewController: UIViewController {

    @IBOutlet weak var spotName: UILabel!
    
    @IBOutlet weak var surfHeight: UILabel!
    
    @IBOutlet weak var tide: UILabel!
    
    @IBOutlet weak var windDirection: UILabel!
    
    @IBOutlet weak var windSpeed: UILabel!
    
    @IBOutlet weak var waterTemp: UILabel!
    
    var beach : String!
    
    var county : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getConditions()
        
        spotName.text = beach
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    private func getConditions(){
        /*
        let baseUrl = "http://api.spitcast.com/api"
        let method = "/county/wind/"
        let county = "\(self.county)/"
        
        let fullUrl = "\(baseUrl)\(method)\(county)"
        let url = URL(string: fullUrl)!
        
        let conditionTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let e = error
            {
                print("error: ", e)
                return
            }
            
            let json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            
            var conditionDict = json as! [[String : AnyObject]]
            
            for i in 0 ..< conditionDict.count
            {
                let wind = [(conditionDict[i]["speed_mph"] as! String)]
                print(wind)

            }
            
        }
        conditionTask.resume()*/
    }
    

}
