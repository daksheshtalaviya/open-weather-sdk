//
//  APIFailureResponse.swift
//  OpenWeatherSDK
//
//  Created by Dksh on 31/05/23.
//

import Foundation

public struct APIFailureResponse : Codable {
    
    /// City ID. Please note that built-in geocoder functionality has been deprecated. [Learn more](https://openweathermap.org/current#builtin).
    public let cod : HTTPStatusCode?
    public let message : String?

}
