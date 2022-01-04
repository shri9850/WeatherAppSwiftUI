//
//  Webservices.swift
//  WeatherAppNew
//
//  Created by shree on 04/01/22.
//

import Foundation
class Webservices {
    func getWeather(by city:String, completion:@escaping(WeatherModel?)->()) {
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=27649ff7147242d542223573418b27f2") else { completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, responses, error) in
            guard let safeData = data else{
                 completion(nil)
                return
            }
            let weatherResponses = try? JSONDecoder().decode(weatherData.self, from: safeData)
            if let weatherResponses = weatherResponses{
                let weatherData = weatherResponses.main
                completion(weatherData)
            }else{
                completion(nil)
            }
        }.resume()
    }
}
