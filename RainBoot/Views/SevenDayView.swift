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
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.darkBlue, .lightBlue]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
                .ignoresSafeArea()
            
            List {
                ForEach(weather.daily.prefix(7)) { weather in
                    HStack {
                        Text(viewModel.convertToDayOfWeek(from: weather.dt))
                            .bold()
                        
                        Spacer()
                        
                        HStack(spacing: 32) {
                            Image(
                                systemName: viewModel.getWeatherSymbol(
                                    weatherCondition: DashboardViewModel.WeatherCondition(
                                        rawValue: weather.weather.first!.main
                                    )!,
                                    sunriseTime: weather.sunrise,
                                    sunsetTime: weather.sunset,
                                    currentTime: weather.dt,
                                    useFillSymbol: true
                                )
                            )
                                .font(.system(size: 24))
                                .symbolRenderingMode(.multicolor)
                            
                            Text("\(viewModel.convertTempToFahrenheit(tempInKelvin: weather.temp.day))°")
                        }
                    }
                    .listRowBackground(Color.grayBlue)
                    .padding()
                    .frame(maxWidth: .infinity)
                }
            }
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
            .padding(.top)
        }
        .navigationTitle("Next 7 Days")
        .preferredColorScheme(.dark)
    }
}

struct SevenDayView_Previews: PreviewProvider {
    static var previews: some View {
        SevenDayView(weather: previewWeather)
    }
}
