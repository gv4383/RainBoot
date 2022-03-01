//
//  WeatherManager.swift
//  RainBoot
//
//  Created by Goyo Vargas on 1/27/22.
//

import Foundation
import CoreLocation

final class WeatherManager {
    let baseWeatherURL = "https://api.openweathermap.org/data/2.5/onecall?appid=\(Bundle.main.infoDictionary?["WEATHER_API_KEY"] ?? "0")"
    let baseGeocodeURL = "https://api.openweathermap.org/geo/1.0/reverse?appid=\(Bundle.main.infoDictionary?["WEATHER_API_KEY"] ?? "0")"
    
    // TODO: Add loading state
    // TODO: Abstract URL logic to be able to use lat/long OR city
    func getWeather(
        latitude: CLLocationDegrees,
        longitude: CLLocationDegrees
    ) async throws -> WeatherFull {
        let urlString = "\(baseWeatherURL)&lat=\(latitude)&lon=\(longitude)&exclude=minutely,alerts"
        let weather: WeatherFull = try await performRequest(with: urlString)
        
        return weather
    }
    
    func getGeocode(
        latitude: CLLocationDegrees,
        longitude: CLLocationDegrees
    ) async throws -> Geocode {
        let urlString = "\(baseGeocodeURL)&lat=\(latitude)&lon=\(longitude)&limit=1"
        let geocodes: [Geocode] = try await performRequest(with: urlString)

        return geocodes.first!
    }
    
    func performRequest<T: Codable>(with urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching data")
        }
        
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        
        return decodedData
    }
}
