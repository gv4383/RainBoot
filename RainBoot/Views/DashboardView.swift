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
        VStack() {
            CityAndDateView(city: geocode.name, currentDate: viewModel.currentDate)
            
            Spacer()
            
            WeatherDisplayView(
                symbol: viewModel.getWeatherSymbol(
                    weatherCondition: DashboardViewModel.WeatherCondition(
                        rawValue: weather.current.weather.first!.main
                    )!
                ),
                temperature: viewModel.convertTempToFahrenheit(tempInKelvin: weather.current.temp),
                description: weather.current.weather.first!.main
            )
            
            Spacer()
        }
        .padding()
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(geocode: previewGeocode, weather: previewWeather)
            .preferredColorScheme(.dark)
    }
}
