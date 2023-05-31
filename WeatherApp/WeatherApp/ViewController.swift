//
//  ViewController.swift
//  WeatherApp
//
//  Created by Dksh on 28/05/23.
//

import UIKit
import OpenWeatherSDK

let WeatherAPIKey = "Your_API_Key"

class ViewController: UIViewController {
    
    
    let weatherService = WeatherService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClickSubmit(_ sender: UIButton) {
        DKLog.log()
        
        OpenWeatherSDK.configure(withAPIKey: WeatherAPIKey)
        OpenWeatherSDK.logMode(.release)
        
        getTodayWeather()
        getForecastWeather()
    }
}

extension ViewController {
    
    private func getTodayWeather() {
        DKLog.log()
        
        weatherService.getWeatherForToday(location: "Ahmedabad") { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let value):
                DKLog.log("value: \(value.name.valueOrEmpty) : \((value.main?.temp).valueOrEmpty)")
                self.loadWeather(weather: value)
            case .failure(let error):
                DKLog.log("error: \(error)")
            }
        }
    }
    
    private func getForecastWeather() {
        DKLog.log()
        
        weatherService.getWeatherForecast(location: "Ahmedabad", timestamps: 7) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let value):
                DKLog.log("value: \((value.list?.count).valueOrEmpty)")
                self.loadWeather(forecast: value)
            case .failure(let error):
                DKLog.log("error: \(error)")
            }
        }
    }
}


extension ViewController {
    
    private func loadWeather(weather: WeatherData) {
        DKLog.log()
        
        print(
    """
    📍Location: \(weather.name.valueOrEmpty), \((weather.sys?.country).valueOrEmpty)
    """
        )
        
        loadWeather(weathers: [weather])
    }
    
    private func loadWeather(forecast: WeatherForecast) {
        DKLog.log(
"""


📍Location: \((forecast.city?.name).valueOrEmpty), \((forecast.city?.country).valueOrEmpty)
"""
        )
        
        loadWeather(weathers: forecast.list.valueOrEmpty)
    }
    
    private func loadWeather(weathers: [WeatherData]) {
        print("""
🟰 Total: \(weathers.count)

""")
        weathers.forEach { weather in
            let temperatureC = (weather.main?.temp).valueOrEmpty.fromKelvinToCelsius
            let speed = String(format: "%.2f", (weather.wind?.speed).valueOrEmpty.toKilometersPerHour)
            
            print(
    """
    ⌚️ Date: \(DateFormatter.fullDayWithTime.string(from: weather.dtTxt.valueOrEmpty))
    🌤️ Weather Info: \((weather.weather?.first?.main).valueOrEmpty): \(temperatureC.toIntValue) °C | \(temperatureC.fromCelsiusToFahrenheit.toIntValue) °F
    💨 Wind Info: Speed: \(speed) km/h
    
    """
            )
        }
    }
    
}

