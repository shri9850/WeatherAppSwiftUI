//
//  WeatherModel.swift
//  WeatherAppNew
//
//  Created by shree on 04/01/22.
//

import Foundation
struct WeatherModel: Decodable {
    var temp: Double?
    var humidity: Int?
}

struct weatherData: Decodable {
    var main: WeatherModel
    
}
