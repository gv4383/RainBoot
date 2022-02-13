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
    
    func convertToDayOfWeek(from unixTime: Double) -> String {
        return formatDate(using: "EEEE", with: unixTime)
    }
    
    func convertToLocalTime(from unixTime: Double) -> String {
        return formatDate(using: "ha", with: unixTime)
    }
    
    func formatDate(using format: String, with unixTime: Double) -> String {
        let date = NSDate(timeIntervalSince1970: unixTime)
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let localDate = formatter.string(from: date as Date)
        
        return localDate
    }
    
    func convertTempToFahrenheit(tempInKelvin: Double) -> Int {
        let convertedTemp = ((tempInKelvin - 273.15) * 9 / 5) + 32
        
        return Int(convertedTemp.rounded())
    }
    
    func getWeatherSymbol(
        weatherCondition: WeatherCondition,
        sunriseTime: Double,
        sunsetTime: Double,
        currentTime: Double,
        useFillSymbol: Bool = false
    ) -> String {
        let symbolType = useFillSymbol
            ? ".fill"
            : ""
        let clearSymbol = currentTime >= sunriseTime && currentTime < sunsetTime
            ? "sun.max\(symbolType)"
            : "moon\(symbolType)"
        
        switch weatherCondition {
        case .thunderstorm:
            return "cloud.bolt.rain\(symbolType)"
        case .drizzle:
            return "cloud.rain\(symbolType)"
        case .rain:
            return "cloud.rain\(symbolType)"
        case .snow:
            return "cloud.snow\(symbolType)"
        case .atmosphere:
            return "cloud.fog\(symbolType)"
        case .clear:
            return clearSymbol
        case .clouds:
            return "cloud\(symbolType)"
        }
    }
}
