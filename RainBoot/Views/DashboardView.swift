//
//  ContentView.swift
//  RainBoot
//
//  Created by Goyo Vargas on 1/27/22.
//

import SwiftUI
import CoreLocationUI

struct DashboardView: View {
    @StateObject var locationManager = LocationManager()
    
    var weatherManager = WeatherManager()
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("Coordinates: \(location.latitude), \(location.longitude)")
            } else {
                LocationButton(.shareCurrentLocation) {
                    locationManager.requestLocation()
                }
                .cornerRadius(30)
                .symbolVariant(.fill)
                .foregroundColor(.white)
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
