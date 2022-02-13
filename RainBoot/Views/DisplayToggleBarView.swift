//
//  DisplayToggleBarView.swift
//  RainBoot
//
//  Created by Goyo Vargas on 2/12/22.
//

import SwiftUI

struct DisplayToggleBarView: View {
    let weather: WeatherFull
    
    var body: some View {
        HStack {
            Text("Today")
                .bold()
            
            Spacer()
            
            NavigationLink {
                SevenDayView(weather: weather)
            } label: {
                HStack {
                    Text("Next 7 Days")
                        .bold()
                    
                    Image(systemName: "arrow.right")
                        .font(Font.body.weight(.bold))
                }
            }
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

struct DisplayToggleBarView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayToggleBarView(weather: previewWeather)
            .preferredColorScheme(.dark)
    }
}
