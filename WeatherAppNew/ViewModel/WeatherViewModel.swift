//
//  WeatherViewModel.swift
//  WeatherAppNew
//
//  Created by shree on 04/01/22.
//

import Foundation
import Combine
class WeatherViewModel: ObservableObject {
    private var weatherServices: Webservices!
    init() {
        self.weatherServices = Webservices()
    }
    @Published var weatherModel: WeatherModel = WeatherModel()
    var temprature: String{
        if let temp = weatherModel.temp{
            return String(format: "%.0f", temp)
        }else{
            return ""
        }
    }
    
    var humidity: String{
        if let temp = weatherModel.humidity{
            return String(format: "%.0f", temp)
        }else{
            return ""
        }
    }
    var cityName: String = ""
    func search() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
            fetchWeather(city: city)
        }
    }
    private func fetchWeather( city: String){
        self.weatherServices.getWeather(by: city) { (weather) in
            if let weather = weather{
                DispatchQueue.main.async {
                    self.weatherModel = weather
                }
            }
        }
    }
}
