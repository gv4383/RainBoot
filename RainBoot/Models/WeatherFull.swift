//
//  Weather.swift
//  RainBoot
//
//  Created by Goyo Vargas on 1/28/22.
//

import Foundation

struct WeatherFull: Codable {
    let lon: Double
    let lat: Double
    let timezone: String
    let timezone_offset: Double
    let current: Current
    let hourly: [Hourly]
    let daily: [Daily]
    
    struct Current: Codable {
        let dt: Double
        let sunrise: Double
        let sunset: Double
        let temp: Double
        let feels_like: Double
        let pressure: Double
        let humidity: Double
        let dew_point: Double
        let uvi: Double
        let clouds: Double
        let visibility: Double
        let wind_speed: Double
        let wind_deg: Double
        let weather: [Weather]
    }
    
    struct Hourly: Codable {
        let dt: Double
        let temp: Double
        let feels_like: Double
        let pressure: Double
        let humidity: Double
        let dew_point: Double
        let uvi: Double
        let clouds: Double
        let visibility: Double
        let wind_speed: Double
        let wind_deg: Double
        let weather: [Weather]
    }
    
    struct Daily: Codable, Identifiable {
        let dt: Double
        let sunrise: Double
        let sunset: Double
        let moonrise: Double
        let moonset: Double
        let moon_phase: Double
        let temp: Temp
        let feels_like: FeelsLike
        let pressure: Double
        let humidity: Double
        let dew_point: Double
        let wind_speed: Double
        let wind_deg: Double
        let weather: [Weather]
        let clouds: Double
        let pop: Double
        let uvi: Double
    }
    
    struct Temp: Codable {
        let day: Double
        let min: Double
        let max: Double
        let night: Double
        let eve: Double
        let morn: Double
    }
    
    struct FeelsLike: Codable {
        let day: Double
        let night: Double
        let eve: Double
        let morn: Double
    }
    
    struct Weather: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
}

extension WeatherFull.Current {
    var feelsLike: Double { return feels_like }
    var dewPoint: Double { return dew_point }
    var windSpeed: Double { return wind_speed }
    var windDeg: Double { return wind_deg }
}

extension WeatherFull.Hourly {
    var feelsLike: Double { return feels_like }
    var dewPoint: Double { return dew_point }
    var windSpeed: Double { return wind_speed }
    var windDeg: Double { return wind_deg }
}

extension WeatherFull.Daily {
    var id: UUID { return UUID() }
    var moonPhase: Double { return moon_phase }
    var dewPoint: Double { return dew_point }
    var windSpeed: Double { return wind_speed }
    var windDeg: Double { return wind_deg }
}
