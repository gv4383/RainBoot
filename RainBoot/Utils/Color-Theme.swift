//
//  Color-Theme.swift
//  RainBoot
//
//  Created by Goyo Vargas on 1/31/22.
//

import SwiftUI

extension ShapeStyle where Self == Color {
    static var darkBlue: Color {
        Color(red: 67 / 255, green: 97 / 255, blue: 238 / 255)
    }
    
    static var lightBlue: Color {
        Color(red: 72 / 255, green: 149 / 255, blue: 239 / 255)
    }
    
    static var grayBlue: Color {
        Color(red: 109 / 255, green: 170 / 255, blue: 242 / 255)
    }
    
    static var disabledGray: Color {
        Color(red: 198 / 255, green: 198 / 255, blue: 179 / 255)
    }
}
