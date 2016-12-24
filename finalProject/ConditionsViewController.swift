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
    
        getSize()
        //print(county, "countyfromit")
        
        spotName.text = beach
        image.image = #imageLiteral(resourceName: "waves")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    private func getSize(){
        
        //http://api.spitcast.com/api/spot/forecast/1/
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
            
            let json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            var sizeDict = json as! [[String : AnyObject]]
            
            print(sizeDict)
            
            for i in 0 ..< sizeDict.count
            {
                let sizeList = [(sizeDict[i]["size"] as! Int)]
                
                for size in sizeList{
                        self.surfHeight.text = String(size)
                }
                
                let shapeList = [(sizeDict[i]["shape_full"] as! String)]
                
                for shape in shapeList{
                    self.shape.text = shape
                }
                
                let dateList = [(sizeDict[i]["date"] as! String)]
                
                for date in dateList{
                    self.date.text = date
                }
                
                //let shapeDetail = [[(sizeDict[i]["shape_detail"] as! String)]]
                

                
                
                


                
            }
        }
        sizeTask.resume()
    }

    
    
}
