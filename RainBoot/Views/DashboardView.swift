//
//  ContentView.swift
//  RainBoot
//
//  Created by Goyo Vargas on 1/27/22.
//

import SwiftUI
import CoreLocation

struct DashboardView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var weatherManager = WeatherManager()
    
    var body: some View {
        Text("Coordinates: \(locationManager.location!.latitude), \(locationManager.location!.longitude)")
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
