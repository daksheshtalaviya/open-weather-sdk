//
//  OpenWeatherSDK.swift
//  OpenWeatherSDK
//
//  Created by Dksh on 30/05/23.
//

import Foundation

public class OpenWeatherSDK {
    
    /// Your unique API key (you can always find it on your account page under the ["API key" tab](https://home.openweathermap.org/api_keys))
    static var apiKey: String = ""
    
    public static func configure(withAPIKey apiKey: String) {
        self.apiKey = apiKey
    }
    
    public static func logMode(_ mode: DKLog.Mode) {
        DKLog.setMode(mode)
    }
    
    public static func isValidAPIKey() -> Bool {
        !apiKey.isEmpty
    }
}
