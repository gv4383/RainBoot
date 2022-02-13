//
//  HourlyWeatherSliderView.swift
//  RainBoot
//
//  Created by Goyo Vargas on 2/10/22.
//

import SwiftUI

struct HourlyWeatherSliderView: View {
    let weather: WeatherFull
    
    @ObservedObject private var viewModel = DashboardViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                HStack(spacing: 16) {
                    ForEach(weather.hourly, id: \.dt) { hourlyWeather in
                        WeatherCapsuleView(
                            time: viewModel.convertToLocalTime(from: hourlyWeather.dt),
                            weatherSymbol: viewModel.getWeatherSymbol(
                                weatherCondition: DashboardViewModel.WeatherCondition(
                                    rawValue: hourlyWeather.weather.first!.main
                                )!,
                                sunriseTime: weather.current.sunrise,
                                sunsetTime: weather.current.sunset,
                                currentTime: hourlyWeather.dt
                            ),
                            temperature: viewModel.convertTempToFahrenheit(
                                tempInKelvin: hourlyWeather.temp
                            )
                        )
                    }
                }
                .padding(32)
                .background(Color.grayBlue)
                .cornerRadius(32)
                .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 4)
            }
            .padding()
        }
    }
}

struct HourlyWeatherSliderView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherSliderView(weather: previewWeather)
            .preferredColorScheme(.dark)
    }
}
