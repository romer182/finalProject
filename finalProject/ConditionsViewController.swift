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
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var shape: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var forecastunavailable: UILabel!
    var beach : String!
    var county : String!
    var spotID : Int!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        getSize()
        
        //spotName.adjustsFontSizeToFitWidth = true
        spotName.text = beach
        image.image = #imageLiteral(resourceName: "waves")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    private func getSize(){
        
        let baseUrl = "http://api.spitcast.com/api"
        let method = "/spot/forecast/"
        let county = String(self.spotID)
        
        
        let fullUrl = "\(baseUrl)\(method)\(county)/"
        let url = URL(string: fullUrl)!
        
        let sizeTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let e = error
            {
                print("error: ", e)
                return
            }
            
            
            do{
                guard let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) else{
                    self.forecastunavailable.text = "Forecast Unavailable."
                    return
                }
                var sizeDict = json as! [[String : AnyObject]]
                
                for i in 0 ..< sizeDict.count
                {
                    let sizeList = [(sizeDict[i]["size"] as! Int)]
                    
                    for size in sizeList{
                        self.surfHeight.text = String(size) + " ft."
                    }
                    
                    let shapeList = [(sizeDict[i]["shape_full"] as! String)]
                    
                    for shape in shapeList{
                        self.shape.text = shape
                    }
                    
                    let dateList = [(sizeDict[i]["date"] as! String)]
                    
                    for date in dateList{
                        self.date.text = date
                    }
                }
                
            }
            catch{
                print("ERROR", error)
            }
        }
        sizeTask.resume()
    }

    
    
}
