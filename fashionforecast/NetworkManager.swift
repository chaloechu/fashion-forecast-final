//
//  NetworkManager.swift
//  fashionforecast
//
//  Created by Chloe Chu on 12/3/21.
//

import Alamofire
import Foundation

class NetworkManager{
    static let endpoint = "https://fashionforecasts.herokuapp.com"
    static let url = URL(string: endpoint)
    
    
    static func getWeather(completion: @escaping (DataResponse) -> Void ){
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result{
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                if let weatherResponse = try? jsonDecoder.decode(WeatherResponse.self, from: data) {
                    let info = weatherResponse.data
                    completion(info)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
