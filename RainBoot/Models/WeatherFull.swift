//
//  Weather.swift
//  RainBoot
//
//  Created by Goyo Vargas on 1/28/22.
//

import Foundation

struct WeatherFull: Codable {
    let id: Int
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let name: String
    
    struct Coord: Codable {
        let lon: Double
        let lat: Double
    }
    
    struct Weather: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
    
    struct Main: Codable {
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
        let pressure: Double
        let humidity: Double
    }
    
    struct Wind: Codable {
        let speed: Double
        let deg: Double
    }
}

extension WeatherFull.Main {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}
