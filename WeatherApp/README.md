
# Open Weather SDK

The Open Weather SDK is a Swift library that provides functionality to retrieve weather information from an API. It allows you to get the current weather for a given location, as well as the weather forecast for a specified number of days.

```markdown

## Installation

To use the Open Weather SDK in your Swift project, follow these steps:

1. Add the OpenWeatherSDK folder to your project.
2. Ensure that the OpenWeatherSDK folder is included in your project's target.

## Usage

To use the Open Weather SDK in your code, follow these steps:

```
1. Configure the SDK with a valid API key:

```swift
OpenWeatherSDK.configure(withAPIKey: "YOUR_API_KEY")
```

2. Retrieve the weather for today:

```swift
weatherService.getWeatherForToday(location: "London") { result in
    switch result {
    case .success(let weather):
        // Handle the weather data
    case .failure(let error):
        // Handle the error
    }
}
```

3. Retrieve the weather forecast for a specified number of days:

```swift
weatherService.getWeatherForecast(location: "London", timestamps: 7) { result in
    switch result {
    case .success(let forecast):
        // Handle the forecast data
    case .failure(let error):
        // Handle the error
    }
}
```

## Running the Tests

To run the unit tests for the Open Weather SDK, follow these steps:

1. Open the WeatherSDKTests folder in Xcode.
2. Build the WeatherSDKTests scheme.
3. Go to the Test Navigator in Xcode.
4. Click on the "Run All Tests" button to run all the tests.

The unit tests cover various scenarios to ensure the correctness and reliability of the Open Weather SDK.

## Contributing

Contributions to the Open Weather SDK are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

The Open Weather SDK is licensed under the [MIT License](LICENSE).
