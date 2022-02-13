//
//  ContentView.swift
//  RainBoot
//
//  Created by Goyo Vargas on 1/27/22.
//

import SwiftUI
import CoreLocation

struct DashboardView: View {
    let geocode: Geocode
    let weather: WeatherFull
    
    @ObservedObject private var viewModel = DashboardViewModel()
    
    var body: some View {
        VStack {
            VStack {
                CityAndDateView(city: geocode.name, currentDate: viewModel.currentDate)
                
                Spacer()
                
                WeatherDisplayView(
                    symbol: viewModel.getWeatherSymbol(
                        weatherCondition: DashboardViewModel.WeatherCondition(
                            rawValue: weather.current.weather.first!.main
                        )!,
                        sunriseTime: weather.current.sunrise,
                        sunsetTime: weather.current.sunset,
                        currentTime: weather.current.dt
                    ),
                    temperature: viewModel.convertTempToFahrenheit(tempInKelvin: weather.current.temp),
                    description: weather.current.weather.first!.main
                )
                
                Spacer()
            }
            .padding()
            
            DisplayToggleBarView(weather: weather)
            
            HourlyWeatherSliderView(weather: weather)
            
            Spacer()
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(geocode: previewGeocode, weather: previewWeather)
            .preferredColorScheme(.dark)
    }
}
