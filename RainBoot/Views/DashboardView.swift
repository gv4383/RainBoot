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
    
    var weatherManager = WeatherManager()
    
    var body: some View {
        Text("Dashboard View")
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(weather: previewWeather)
    }
}
