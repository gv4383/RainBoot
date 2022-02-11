//
//  HourlyWeatherSliderView.swift
//  RainBoot
//
//  Created by Goyo Vargas on 2/10/22.
//

import SwiftUI

struct HourlyWeatherSliderView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(0..<10) { _ in
                    WeatherCapsuleView(time: "8AM", weatherSymbol: "sun.max", temperature: "100°")
                }
            }
            .padding(32)
            .background(Color.grayBlue)
            .cornerRadius(32)
        }
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
    }
}

struct HourlyWeatherSliderView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherSliderView()
            .preferredColorScheme(.dark)
    }
}
