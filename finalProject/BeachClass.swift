//
//  BeachClass.swift
//  finalProject
//
//  Created by Jordyn Romero on 12/4/16.
//  Copyright © 2016 Jordyn Romero. All rights reserved.
//

import Foundation

class Beach{
    
    var _county : String
    
    var county : String{
        return _county
    }
    var _longitude : String
    
    var longitude : String{
        return _longitude
    }
    var _latitude : String
    
    var latitude : String{
        return _latitude
    }
    var _spot_id : String
    var spot_id : String{
        return _spot_id
    }
    
    var spot_name : String
    
    init(){
        self._county = ""
        self._longitude = ""
        self._latitude = ""
        self._spot_id = ""
        self.spot_name = ""
    }
    
        }



/*
 
 
 API:
 GET request
 http://www.json.org/
 imagine you have an object called a company. the company has a company name, year founded, active and list of employees. An employee is another class that has a first name and last name.
 KEYS and VALUES
 
 swift parses for you
 d = dictionary
 
 
 d["company_name"]

 
 "http://api.spitcast.com/api/spot/all"
 */
















