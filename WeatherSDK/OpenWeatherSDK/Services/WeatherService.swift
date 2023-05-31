//
//  WeatherService.swift
//  OpenWeatherSDK
//
//  Created by Dksh on 28/05/23.
//

public class WeatherService {
        
    private let apiService: APIService = APIService()
    
    public init() {}
    
    /// Retrieves weather data for the specified location for the current day.
    /// - Parameters:
    ///   - location: A string representing the location for which weather data is requested.
    ///   - completion: A closure to be called once the weather data retrieval is completed. It takes a `Result` enum with a generic type `WeatherData` and an `Error` object as parameters. The closure will be called with either a `Result.success` containing the retrieved `WeatherData` object or a `Result.failure` with an `Error` object if an error occurs during the retrieval process.
    public func getWeatherForToday(location: String, completion: @escaping (Result<WeatherData, Error>) -> Void) {
        
        let parameter = WeatherParameter()
        parameter.q = location
        
        let request: APIRequest = .getTodayWeatherData(parameter: parameter)
        apiService.getObject(request: request, completion: completion)
    }
    
    /// Retrieves weather data for the current day based on the specified latitude and longitude coordinates.
    /// - Parameters:
    ///   - latitude: The latitude coordinate for which weather data is requested.
    ///   - longitude: The longitude coordinate for which weather data is requested.
    ///   - completion: A closure to be called once the weather data retrieval is completed. It takes a `Result` enum with a generic type `WeatherData` and an `Error` object as parameters. The closure will be called with either a `Result.success` containing the retrieved `WeatherData` object or a `Result.failure` with an `Error` object if an error occurs during the retrieval process.
    public func getWeatherForToday(latitude: Double, longitude: Double, completion: @escaping (Result<WeatherData, Error>) -> Void) {
        
        let parameter = WeatherParameter()
        parameter.lat = latitude
        parameter.lon = longitude
        
        let request: APIRequest = .getTodayWeatherData(parameter: parameter)
        apiService.getObject(request: request, completion: completion)
    }
    
    /// Retrieves weather forecast data for the specified location for a given number of days.
    /// - Parameters:
    ///   - location: A string representing the location for which weather forecast data is requested.
    ///   - timestamps: An integer specifying the number of timestamps for which forecast data should be retrieved.
    ///   - completion: A closure to be called once the weather forecast data retrieval is completed. It takes a `Result` enum with a generic type `WeatherForecast` and an `Error` object as parameters. The closure will be called with either a `Result.success` containing the retrieved `WeatherForecast` object or a `Result.failure` with an `Error` object if an error occurs during the retrieval process.
    public func getWeatherForecast(location: String, timestamps: Int, completion: @escaping (Result<WeatherForecast, Error>) -> Void) {
        
        let parameter = ForecastParameter()
        parameter.cnt = timestamps
        parameter.q = location

        let request: APIRequest = .getForecastWeatherData(parameter: parameter)
        apiService.getObject(request: request, completion: completion)
    }
    
    /// Retrieves weather forecast data for the specified latitude and longitude coordinates for a given number of days.
    /// - Parameters:
    ///   - latitude: The latitude coordinate for which weather data is requested.
    ///   - longitude: The longitude coordinate for which weather data is requested.
    ///   - timestamps: An integer specifying the number of timestamps for which forecast data should be retrieved.
    ///   - completion: A closure to be called once the weather forecast data retrieval is completed. It takes a `Result` enum with a generic type `WeatherForecast` and an `Error` object as parameters. The closure will be called with either a `Result.success` containing the retrieved `WeatherForecast` object or a `Result.failure` with an `Error` object if an error occurs during the retrieval process.
    public func getWeatherForecast(latitude: Double, longitude: Double, timestamps: Int, completion: @escaping (Result<WeatherForecast, Error>) -> Void) {
        
        let parameter = ForecastParameter()
        parameter.cnt = timestamps
        parameter.lat = latitude
        parameter.lon = longitude
        
        let request: APIRequest = .getForecastWeatherData(parameter: parameter)
        apiService.getObject(request: request, completion: completion)
    }
}

