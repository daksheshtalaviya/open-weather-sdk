
# Open Weather SDK

The Open Weather SDK is a Swift library that provides functionality to retrieve weather information from an API. It allows you to get the current weather for a given location, as well as the weather forecast for a specified number of days.


## Installation


To install the Open Weather SDK, follow these steps:
```markdown

1. Ensure that Xcode is installed on your system.
2. Download the SDK package from the official website or repository.
3. Extract the contents of the package.
4. Open your Xcode project.
5. Drag and drop the Open Weather SDK files into your project's file structure.
6. Make sure the SDK is properly linked and configured in your project settings.

```

## Usage

To use the Open Weather SDK in your code, follow these steps:

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


## Documentation

```markdown

1. Locate the "Documentation" folder in the root directory of the project.
2. In the "Documentation" folder, find the file named "OpenWeatherSDK.doccarchive". This file contains the documentation for the Open Weather SDK.
3. Open the "OpenWeatherSDK.doccarchive" file using Xcode, as it is required for viewing DocC files.
4. Ensure that the Swift language is selected in Xcode for proper interpretation of the documentation.
5. Once the file is opened, you will be able to access the documentation for each class, function, and property included in the Open Weather SDK.

![Select Swift language](http://url/to/img.png](https://drive.google.com/file/d/10ou-4CCgWLyosI_rMfuXYcDp-YGWpTLZ/view?usp=sharing)

```

## Contributing

Contributions to the Open Weather SDK are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

The Open Weather SDK is licensed under the [MIT License](LICENSE).
