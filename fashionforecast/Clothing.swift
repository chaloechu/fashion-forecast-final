//
//  Clothing.swift
//  fashionforecast
//
//  Created by Chloe Chu on 11/18/21.
//

import Foundation
import UIKit

class Clothing{
    var imageName: String
    var type: String
    var description: String
    var season: String
    
    init(imageName: String, type: String, description: String, season: String){
        self.imageName = imageName
        self.type = type
        self.description = description
        self.season = season
    }
    
}
