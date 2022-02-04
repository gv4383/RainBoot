//
//  DashboardViewModel.swift
//  RainBoot
//
//  Created by Goyo Vargas on 2/3/22.
//

import Foundation

final class DashboardViewModel: ObservableObject {
    enum WeatherCondition: String {
        case thunderstorm = "Thunderstorm"
        case drizzle = "Drizzle"
        case rain = "Rain"
        case snow = "Snow"
        case atmosphere = "Atmosphere"
        case clear = "Clear"
        case clouds = "Clouds"
    }
    
    var currentDate: String {
        Date().formatted(.dateTime.weekday().month().day())
    }
    
    func convertTempToFahrenheit(tempInKelvin: Double) -> Int {
        let convertedTemp = ((tempInKelvin - 273.15) * 9 / 5) + 32
        
        return Int(convertedTemp.rounded())
    }
    
    func getWeatherSymbol(weatherCondition: WeatherCondition) -> String {
        switch weatherCondition {
        case .thunderstorm:
            return "cloud.bolt.rain.fill"
        case .drizzle:
            return "cloud.rain.fill"
        case .rain:
            return "cloud.rain.fill"
        case .snow:
            return "cloud.snow.fill"
        case .atmosphere:
            return "cloud.fog.fill"
        case .clear:
            return "sun.max.fill"
        case .clouds:
            return "cloud.fill"
        }
    }
}
