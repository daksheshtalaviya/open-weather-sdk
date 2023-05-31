//
//  ForecastParameter.swift
//  OpenWeatherSDK
//
//  Created by Dksh on 28/05/23.
//

import Foundation

/// A data structure representing the parameters for requesting weather forecast data.
public class ForecastParameter : Codable {
   
    /// Your unique API key (you can always find it on your account page under the ["API key" tab](https://home.openweathermap.org/api_keys))
    public var appid: String = OpenWeatherSDK.apiKey
    
    /// A number of timestamps, which will be returned in the API response. [Learn more](https://openweathermap.org/forecast5#limit)
    public var cnt: Int?
    
    /// City name, state code and country code divided by comma, Please, refer to [ISO 3166](https://www.iso.org/obp/ui/#search) for the state codes or country codes.
    /// You can specify the parameter not only in English. In this case, the API response should be returned in the same language as the language of requested location name if the location is in our predefined list of more than 200,000 locations.
    public var q: String?
    
    /// Latitude of the location
    public var lat: Double?
    
    /// Longitude of the location
    public var lon: Double?
}
