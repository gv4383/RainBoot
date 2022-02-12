//
//  DisplayToggleBarView.swift
//  RainBoot
//
//  Created by Goyo Vargas on 2/12/22.
//

import SwiftUI

struct DisplayToggleBarView: View {
    var body: some View {
        HStack {
            Text("Today")
                .bold()
            
            Spacer()
            
            HStack {
                Text("Next 7 Days")
                    .bold()
                
                Image(systemName: "arrow.right")
                    .font(Font.body.weight(.bold))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

struct DisplayToggleBarView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayToggleBarView()
            .preferredColorScheme(.dark)
    }
}
