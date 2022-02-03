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
    
    @EnvironmentObject var locationManager: LocationManager
    
    // TODO: Move this to view model
    var currentDate: String {
        Date().formatted(.dateTime.weekday().month().day())
    }
    
    // TODO: Move this to view model
    var temperature: Int {
        let tempInKelvin = weather.main.temp
        let convertedTemp = ((tempInKelvin - 273.15) * 9 / 5) + 32
        
        return Int(convertedTemp.rounded())
    }
    
    var body: some View {
        VStack() {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(weather.name),")
                        .bold().font(.title)
                    
                    Text(currentDate)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            VStack(spacing: 5) {
                Text("Today")
                    .font(.title)
                
                HStack(spacing: 10) {
                    Image(systemName: "sun.max")
                        .font(.system(size: 48))
                    
                    Text("\(temperature)°")
                        .bold().font(.largeTitle)
                }
                
                Text(weather.weather.first?.main ?? "N/A")
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
