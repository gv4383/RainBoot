//
//  ContentView.swift
//  RainBoot
//
//  Created by Goyo Vargas on 1/31/22.
//

import SwiftUI
import CoreLocationUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.darkBlue, .lightBlue]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
                .ignoresSafeArea()
            
            VStack {
                if locationManager.location != nil {
                    DashboardView()
                        .environmentObject(locationManager)
                } else {
                    if locationManager.isLoading {
                        LoadingView()
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
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
