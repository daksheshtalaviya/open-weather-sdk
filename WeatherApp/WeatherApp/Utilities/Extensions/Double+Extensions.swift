//
//  Double+Extensions.swift
//  WeatherSDK
//
//  Created by Dksh on 28/05/23.
//

import Foundation

extension Double {
    
    var fromKelvinToCelsius: Double {
        self - 273.15
    }
    
    var fromCelsiusToFahrenheit: Double {
        self * 9/5 + 32
    }
    
    var fromFahrenheitToCelsius: Double {
        (self - 32) * 5/9
    }
    
    var toIntValue: Int { Int(self) }
    
    var toKilometersPerHour: Double {
        self * 3.6
    }
}
