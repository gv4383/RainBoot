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
    
    @EnvironmentObject private var locationManager: LocationManager
    @ObservedObject private var viewModel = DashboardViewModel()
    
    var body: some View {
        VStack() {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(weather.name)")
                        .bold().font(.title)
                    
                    Text(viewModel.currentDate)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            VStack(spacing: 5) {
                Text("Today")
                    .font(.title)
                
                HStack(spacing: 10) {
                    Image(
                        systemName: viewModel.getWeatherSymbol(
                            weatherCondition: DashboardViewModel.WeatherCondition(
                                rawValue: weather.weather.first!.main
                            )!
                        )
                    )
                        .font(.system(size: 48))
                        .symbolRenderingMode(.multicolor)
                    
                    Text("\(viewModel.convertTempToFahrenheit(tempInKelvin: weather.main.temp))°")
                        .bold().font(.largeTitle)
                }
                
                Text(weather.weather.first!.main)
                    .font(.title3)
            }
            
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
