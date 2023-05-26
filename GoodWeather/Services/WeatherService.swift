//
//  WeatherService.swift
//  GoodWeather
//
//  Created by ray on 5/17/23.
//

import Foundation

class WeatherService {
    
    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
    
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=f93025c22d7ee6dc093a6f7690e52f9e&units=metric") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
            
        }.resume()
    }
}
