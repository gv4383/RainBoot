//
//  ContentView.swift
//  RainBoot
//
//  Created by Goyo Vargas on 1/27/22.
//

import SwiftUI

struct DashboardView: View {
    var weatherManager = WeatherManager()
    
    var body: some View {
        VStack {
            Text("Dashboard View")
                .padding()
        }
//        .task {
//            do {
//                try await weatherManager.getCurrentWeather(cityId: 4671654)
//            } catch {
//                print("Error getting weather: \(error)")
//            }
//        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
