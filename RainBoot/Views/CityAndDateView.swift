//
//  CityAndDateView.swift
//  RainBoot
//
//  Created by Goyo Vargas on 2/6/22.
//

import SwiftUI

struct CityAndDateView: View {
    let city: String
    let currentDate: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("\(city)")
                    .bold().font(.title)
                
                Text(currentDate)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct CityAndDateView_Previews: PreviewProvider {
    static var previews: some View {
        CityAndDateView(city: "New York", currentDate: "Sun, Feb 6")
    }
}
