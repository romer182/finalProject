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
    
    @IBOutlet weak var shape: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    var beach : String!
    
    var county : String!
    
    var spotID : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        spotName.text = beach
        image.image = #imageLiteral(resourceName: "waves")
        
        print(spotID, "didselectrow")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    private func getWind(){
        
        let baseUrl = "http://api.spitcast.com/api"
        let method = "/county/wind/"
        let county = "\(self.county)/"
        
        let fullUrl = "\(baseUrl)\(method)\(county)"
        let url = URL(string: fullUrl)!
        
        let windTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let e = error
            {
                print("error: ", e)
                return
            }
            let json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            var windDict = json as! [[String : AnyObject]]
            for i in 0 ..< windDict.count
            {
                let windSpeed = [(windDict[i]["speed_mph"] as! String)]
                print(windSpeed)
                let windDirection = [(windDict[i]["direction_text"] as! String)]
                print(windDirection)
            }
        }
        windTask.resume()
    }
    
    private func getTide(){
        
        let baseUrl = "http://api.spitcast.com/api"
        let method = "/county/tide/"
        let county = "\(self.county)/"
        
        let fullUrl = "\(baseUrl)\(method)\(county)"
        let url = URL(string: fullUrl)!
        
        let tideTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let e = error
            {
                print("error: ", e)
                return
            }
            let json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            var tideDict = json as! [[String : AnyObject]]
            for i in 0 ..< tideDict.count
            {
                let tideFT = [(tideDict[i]["tide"] as! String)]
                print(tideFT)

            }
        }
        tideTask.resume()
    }
    
    private func getSize(){
        
        let baseUrl = "http://api.spitcast.com/api"
        let method = "/spot/forecast/"
        let county = "\(self.spotID)/"
        
        let fullUrl = "\(baseUrl)\(method)\(county)"
        let url = URL(string: fullUrl)!
        
        let sizeTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let e = error
            {
                print("error: ", e)
                return
            }
            let json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            var sizeDict = json as! [[String : AnyObject]]
            for i in 0 ..< sizeDict.count
            {
                let size = [(sizeDict[i]["size"] as! String)]
                print(size)
                let shape = [(sizeDict[i]["shape_full"] as! String)]
                print(shape)
            }
        }
        sizeTask.resume()
    }


}
