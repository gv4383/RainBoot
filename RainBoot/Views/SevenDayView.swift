//
//  SevenDayView.swift
//  RainBoot
//
//  Created by Goyo Vargas on 2/12/22.
//

import SwiftUI

struct SevenDayView: View {
    let weather: WeatherFull
    
    @ObservedObject private var viewModel = DashboardViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Next 7 Days")
                    .bold().font(.largeTitle)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            List {
                ForEach(weather.daily) { weather in
                    HStack {
                        Text("Day")
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: viewModel.getWeatherSymbol(
                                weatherCondition: DashboardViewModel.WeatherCondition(
                                    rawValue: weather.weather.first!.main
                                )!,
                                sunriseTime: weather.sunrise,
                                sunsetTime: weather.sunset,
                                currentTime: weather.dt)
                            )
                            
                            Text("\(viewModel.convertTempToFahrenheit(tempInKelvin: weather.temp.day))°")
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
        }
    }
}

struct SevenDayView_Previews: PreviewProvider {
    static var previews: some View {
        SevenDayView(weather: previewWeather)
    }
}
