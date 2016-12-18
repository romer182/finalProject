//
//  JSON.swift
//  finalProject
//
//  Created by Jordyn Romero on 12/11/16.
//  Copyright © 2016 Jordyn Romero. All rights reserved.
//

import Foundation

enum SerializationError: Error {
    case missing(String)
}

extension Beach {
    convenience init(json: [String: Any]) throws {
        // Extract name
        guard let spot_name = json["spot_name"] as? String else {
            throw SerializationError.missing("spot_name")
        }
        
        /* Extract and validate coordinates
        guard let coordinatesJSON = json["coordinates"] as? [String: Double],
            let latitude = coordinatesJSON["lat"],
            let longitude = coordinatesJSON["lng"]
            else {
                throw SerializationError.missing("coordinates")
        }
        
        let coordinates = (latitude, longitude)
        guard case (-90...90, -180...180) = coordinates else {
            throw SerializationError.invalid("coordinates", coordinates)
        }
        
        // Extract and validate meals
        guard let mealsJSON = json["spot_name"] as? [String] else {
            throw SerializationError.missing("meals")
        }*/
        

        
        // Initialize properties
        self.spot_name = spot_name
    }
}
