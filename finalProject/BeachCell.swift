//
//  BeachCell.swift
//  finalProject
//
//  Created by Jordyn Romero on 12/11/16.
//  Copyright © 2016 Jordyn Romero. All rights reserved.
//

import UIKit

class BeachCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    var beach : String!
    var navController : UINavigationController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func populate(beach: String, navController: UINavigationController){
        
        self.beach = beach
        self.navController = navController
        self.titleLabel.text = beach
        
    }
    
}
