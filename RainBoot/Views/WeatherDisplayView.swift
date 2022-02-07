//
//  WeatherDisplayView.swift
//  RainBoot
//
//  Created by Goyo Vargas on 2/6/22.
//

import SwiftUI

struct WeatherDisplayView: View {
    let symbol: String
    let temperature: Int
    let description: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text("Today")
                .font(.title)
            
            HStack(spacing: 10) {
                Image(systemName: symbol)
                    .font(.system(size: 48))
                    .symbolRenderingMode(.multicolor)
                
                Text("\(temperature)°")
                    .bold().font(.largeTitle)
            }
            
            Text(description)
                .font(.title3)
        }
    }
}

struct WeatherDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDisplayView(symbol: "sun.max.fill", temperature: 78, description: "Clear")
    }
}
