//
//  CountyCell.swift
//  finalProject
//
//  Created by Jordyn Romero on 12/11/16.
//  Copyright © 2016 Jordyn Romero. All rights reserved.
//

import UIKit

class CountyCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    var county : String!
    var navController : UINavigationController!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    
    func populate(county: String, navController: UINavigationController){
        
        self.county = county
        self.navController = navController
        self.titleLabel.text = county

    }
    
}
