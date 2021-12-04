//
//  Weather.swift
//  fashionforecast
//
//  Created by Chloe Chu on 12/3/21.
//

import Foundation

struct WeatherResponse: Codable{
    var success: Bool
    var data: DataResponse
}

struct DataResponse: Codable{
    var weather: [Weather]
    var main: Temperature
}

struct Weather: Codable{
    var main: String
    var description: String
}

struct Temperature: Codable{
    var temp: Double
}

