//
//  WeatherCapsuleView.swift
//  RainBoot
//
//  Created by Goyo Vargas on 2/10/22.
//

import SwiftUI

struct WeatherCapsuleView: View {
    let time: String
    let weatherSymbol: String
    let temperature: String
    
    var body: some View {
        VStack(spacing: 16) {
            Text(time)
                .font(.footnote)
            
            Image(systemName: weatherSymbol)
                .font(.system(size: 32))
            
            Text(temperature)
                .font(.footnote)
        }
        .padding()
        .background(Color.darkBlue)
        .clipShape(Capsule())
        .preferredColorScheme(.dark)
    }
}

struct WeatherCapsuleView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCapsuleView(time: "8AM", weatherSymbol: "sun.max", temperature: "100°")
    }
}
