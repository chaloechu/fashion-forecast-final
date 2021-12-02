//
//  Forecast.swift
//  fashionforecast
//
//  Created by Chloe Chu on 11/21/21.
//

import Foundation
import UIKit

class Forecast{
    var temperature: String
    var weather: String
    var dayOfWeek: String
    
    init(temperature: String, weather: String, dayOfWeek: String){
        self.temperature = temperature
        self.weather = weather
        self.dayOfWeek = dayOfWeek
    }
    
}
