//
//  APIRequest.swift
//  OpenWeatherSDK
//
//  Created by Dksh on 29/05/23.
//

import Foundation

/// An enumeration representing different types of API requests for weather data.
enum APIRequest {
    
    /// Represents an API request to retrieve today's weather data for a specific parameter.
    /// - Parameters:
    ///    - parameter: An instance of `WeatherParameter` specifying the parameter for today's weather data request.
    case getTodayWeatherData(parameter: WeatherParameter)
    
    /// Represents an API request to retrieve 5-day/3-hour forecast weather data for a specific parameter.
    /// - Parameters:
    ///    - parameter: An instance of `ForecastParameter` specifying the parameter for forecast weather data request.
    case getForecastWeatherData(parameter: ForecastParameter)
    
}


extension APIRequest {
    
    /// The base URL of the API.
    var baseUrl: String {
        let hostUrl: String = "https://api.openweathermap.org"
        return "\(hostUrl)/data/2.5"
    }
    
    /// The HTTP method to be used for the API request.
    var httpMethod: HTTPMethod {
        switch self {
        default: return .get
        }
    }
    
    /// The endpoint of the API.
    var endPoint: String {
        switch self {
        case .getTodayWeatherData:
            return "/weather"
            
        case .getForecastWeatherData:
            return "/forecast"
        }
    }
    
    /// The parameters to be included in the API request. (Optional)
    var parameters: Any? {
        switch self {
        case .getTodayWeatherData(let parameter):
            return parameter.toJSON()
        case .getForecastWeatherData(let parameter):
            return parameter.toJSON()
        }
    }
    
    /// The key path to be used for parsing the API response. (Optional)
    var keyPath: String? {
        switch self {
        default: return nil
        }
    }
    
    /// The timeout duration for the API request.
    var timeout: TimeInterval {
        switch self {
            default:
                return 30.0
        }
    }
    
    /// The headers to be included in the API request. (Optional)
    var headers: [String : String]? {
        switch self {
            default:
                return nil
        }
    }
    
}


extension APIRequest: URLRequestConvertible {
    
    /// The `URL` formed by combining the base `URL` and the endpoint. (Optional)
    var urlWithEndPoint: URL? {
        let strURL: String = baseUrl + endPoint
        return strURL.url
    }
    
    /// Converts the API configuration into a URLRequest object.
    /// - Throws: An error of type `Error` if there is an issue in creating the URLRequest.
    /// - Returns: A URLRequest object representing the API request configuration.
    /// - Important: This method assumes that the API configuration is valid and all necessary properties are properly set.
    func asURLRequest() throws -> URLRequest {
        
        let urlMain : URL? = self.urlWithEndPoint
        guard let url = urlMain else {
            fatalError( "Request URL invalid for \(self)")
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        if let headers = self.headers, headers.count > 0 {
            headers.forEach { (key, value) in
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        var encodedURLRequest: URLRequest
        switch self {
        default:
            encodedURLRequest = try URLEncoding.queryString.encode(request as URLRequestConvertible, with: parameters as? Parameters)
        }
        
        encodedURLRequest.timeoutInterval = self.timeout
        
        DKLog.log("""
\(#function)

🕒 API Request: \(Date().description):
URL: \(encodedURLRequest.httpMethod ?? "") : \(encodedURLRequest.url?.absoluteString ?? "")
Parameters: \(String(data: encodedURLRequest.httpBody ?? Data(), encoding: .utf8) ?? "")
HeaderFields: \(encodedURLRequest.allHTTPHeaderFields ?? [:])
""")
        
        return encodedURLRequest
    }
}
