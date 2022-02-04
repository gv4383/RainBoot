//
//  ContentViewModel.swift
//  RainBoot
//
//  Created by Goyo Vargas on 2/1/22.
//

import Foundation

final class ContentViewModel: ObservableObject {
    @Published var weather: WeatherFull?
}
