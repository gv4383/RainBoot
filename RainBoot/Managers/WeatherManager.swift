//
//  WeatherManager.swift
//  RainBoot
//
//  Created by Goyo Vargas on 1/27/22.
//

import Foundation

class WeatherManager {
    func getCurrentWeather(cityId: Int) async throws -> WeatherFull {
        let weatherURL = "https://api.openweathermap.org/data/2.5/weather?id=\(cityId)&appid=\(ProcessInfo.processInfo.environment["WEATHER_API_KEY"] ?? "0")"
        
        guard let url = URL(string: weatherURL) else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        let decodedData = try JSONDecoder().decode(WeatherFull.self, from: data)
        
        return decodedData
    }
}
