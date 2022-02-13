//
//  ContentView.swift
//  RainBoot
//
//  Created by Goyo Vargas on 1/31/22.
//

import SwiftUI
import CoreLocationUI

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @ObservedObject private var viewModel = ContentViewModel()
    
    let weatherManager = WeatherManager()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.darkBlue, .lightBlue]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                    .ignoresSafeArea()
                
                VStack {
                    if locationManager.location != nil {
                        if viewModel.geocode != nil && viewModel.weather != nil {
                            DashboardView(geocode: viewModel.geocode!, weather: viewModel.weather!)
                        } else {
                            LoadingView()
                                .task {
                                    do {
                                        viewModel.weather = try await weatherManager.getWeather(
                                            latitude: locationManager.location!.latitude,
                                            longitude: locationManager.location!.longitude
                                        )
                                    } catch {
                                        print("Error getting weather:", error)
                                    }
                                    
                                    do {
                                        viewModel.geocode = try await weatherManager.getGeocode(
                                            latitude: locationManager.location!.latitude,
                                            longitude: locationManager.location!.longitude
                                        )
                                    } catch {
                                        print("Error getting geocode:", error)
                                    }
                                }
                        }
                    } else {
                        if locationManager.isLoading {
                            LoadingView()
                        } else {
                            WelcomeView()
                                .environmentObject(locationManager)
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
