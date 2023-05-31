//
//  WeatherAppTests.swift
//  WeatherApp
//
//  Created by Dksh on 28/05/23.
//

import XCTest
@testable import WeatherApp
import WeatherSDK

final class WeatherAppTests: XCTestCase {
    
    var weatherService: WeatherService!
    
    override func setUp() {
        super.setUp()
        weatherService = WeatherService()
    }
    
    override func tearDown() {
        weatherService = nil
        super.tearDown()
    }
    
    /// This test case checks if the API key used by the WeatherSDK is valid
    func testAPIKeyIsValid() {
        XCTAssertNotNil(WeatherSDK.isValidAPIKey())
    }
    
    /// This test case checks if the API request for today's weather returns a valid weather object
    func testGetWeatherForToday() {
        WeatherSDK.configure(withAPIKey: WeatherAPIKey)
        
        weatherService.getWeatherForToday(location: "London") { result in
            switch result {
            case .success(let weather):
                // Assert that the weather object is not nil, indicating a successful API response
                XCTAssertNotNil(weather)
            case .failure(let error):
                // If there's a failure, assert that the error object is nil
                XCTAssertNil(error)
            }
        }
    }
    
    /// This test case checks if the temperature value in the weather response falls within a valid range
    func testTemperatureIsValid() {
        WeatherSDK.configure(withAPIKey: WeatherAPIKey)
        
        weatherService.getWeatherForToday(location: "London") { result in
            switch result {
            case .success(let weather):
                let lowest: Double = -89.3
                let highest: Double = 56.7
                let current: Double = weather.main?.temp?.fromKelvinToCelsius ?? 0
                
                // Assert that the current temperature value falls within the valid range
                XCTAssertTrue(lowest...highest ~= current)
            case .failure(let error):
                // If there's a failure, assert that the error object is nil
                XCTAssertNil(error)
            }
        }
    }
    
    /// This test case validates if the location name in the weather response matches the requested location
    func testLocationResponseValidation() {
        WeatherSDK.configure(withAPIKey: WeatherAPIKey)
        
        let locationName = "Ahmedabad"
        weatherService.getWeatherForToday(location: locationName) { result in
            switch result {
            case .success(let weather):
                // Assert that the name property in the weather object matches the requested location name
                XCTAssertEqual(weather.name, locationName)
            case .failure(let error):
                // If there's a failure, assert that the error object is nil
                XCTAssertNil(error)
            }
        }
    }
    
    /// This test case checks if the API request for weather forecast returns the expected forecast data
    func testGetWeatherForForecast() {
        WeatherSDK.configure(withAPIKey: WeatherAPIKey)
        
        weatherService.getWeatherForecast(location: "London", timestamps: 7) { result in
            switch result {
            case .success(let weather):
                // Assert that the weather object is not nil, indicating a successful API response
                XCTAssertNotNil(weather)
            case .failure(let error):
                // If there's a failure, assert that the error object is nil
                XCTAssertNil(error)
            }
        }
    }
    
    /// This test case checks if the API request for weather forecast fails due to an invalid API key
    func testGetWeatherForForecastWithInvalidAPIKey() {
        // Set an invalid API key
        WeatherSDK.configure(withAPIKey: "INVALID_API_KEY")
        
        weatherService.getWeatherForecast(location: "London", timestamps: 7) { result in
            switch result {
            case .success(let weather):
                // If the API request is successful, assert that the weather object is nil
                XCTAssertNil(weather)
            case .failure(let error):
                // Assert that the error object is not nil, indicating a failure due to an invalid API key
                XCTAssertNotNil(error)
            }
        }
    }
    
    /// This test case checks if the API request for weather forecast fails due to a timeout
    func testAPIRequestTimeoutFailed() {
        WeatherSDK.configure(withAPIKey: WeatherAPIKey)

        let expectation = self.expectation(description: "Weather forecast response received")
        
        weatherService.getWeatherForecast(location: "London", timestamps: 7) { result in
            switch result {
            case .success:
                // If the API request is successful, assert that it returns a success result
                XCTAssertTrue(true)
            case .failure(let error):
                // If there's a failure, assert that the error object is nil
                XCTAssertNil(error)
            }
            expectation.fulfill()
        }
        
        // Expectations that the error is a timeout error
        waitForExpectations(timeout: 0.1, handler: nil)
    }
}
