//
//  OpenWeatherSDK.swift
//  OpenWeatherSDK
//
//  Created by Dksh on 30/05/23.
//

import Foundation

/// A class representing the OpenWeatherSDK, which provides functionality to configure the SDK, set the API key, and check the validity of the API key.
public class OpenWeatherSDK {
    
    /// Your unique API key (you can always find it on your account page under the ["API key" tab](https://home.openweathermap.org/api_keys))
    static var apiKey: String = ""
    
    /// Configures the OpenWeatherSDK with the provided API key.
    /// - Parameter apiKey: Your unique API key obtained from your OpenWeatherMap account page.
    public static func configure(withAPIKey apiKey: String) {
        self.apiKey = apiKey
    }
    
    /// Sets the log mode for the OpenWeatherSDK.
    /// - Parameter mode: The log mode to be set. Use the DKLog.Mode enum to specify the desired log mode.
    public static func logMode(_ mode: DKLog.Mode) {
        DKLog.setMode(mode)
    }
    
    /// Checks if the API key has been set and is valid.
    /// - Returns: A boolean value indicating whether the API key is valid or not. true if the API key is valid and has been set, false otherwise.
    public static func isValidAPIKey() -> Bool {
        !apiKey.isEmpty
    }
}
