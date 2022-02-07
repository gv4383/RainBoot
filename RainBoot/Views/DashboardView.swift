//
//  ContentView.swift
//  RainBoot
//
//  Created by Goyo Vargas on 1/27/22.
//

import SwiftUI
import CoreLocation

struct DashboardView: View {
    let weather: WeatherFull
    
    @ObservedObject private var viewModel = DashboardViewModel()
    
    var body: some View {
        VStack() {
            CityAndDateView(city: weather.name, currentDate: viewModel.currentDate)
            
            Spacer()
            
            WeatherDisplayView(
                symbol: viewModel.getWeatherSymbol(
                    weatherCondition: DashboardViewModel.WeatherCondition(
                        rawValue: weather.weather.first!.main
                    )!
                ),
                temperature: viewModel.convertTempToFahrenheit(tempInKelvin: weather.main.temp),
                description: weather.weather.first!.main
            )
            
            Spacer()
        }
        .padding()
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(weather: previewWeather)
            .preferredColorScheme(.dark)
    }
}
