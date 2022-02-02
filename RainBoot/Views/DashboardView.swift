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
