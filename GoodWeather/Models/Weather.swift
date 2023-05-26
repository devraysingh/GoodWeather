//
//  Weather.swift
//  GoodWeather
//
//  Created by ray on 5/17/23.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {

    var temp: Double?
    var humidity: Double?
    
}



