//
//  WeatherManager.swift
//  Clima
//
//  Created by Kanha Gupta on 29/06/24.

import Foundation
import CoreLocation

//Protocol is used here
//If any other class wants to use the WeatherManager Functionality then it can adopt this delegate
protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailedWithError(error: Error)
}
//Use your own API KEY here
let apikey = ProcessInfo.processInfo.environment["OPENWEATHERAPIKEY"]

//Structure for Weather Manager
struct WeatherManager {
    //Default String that we get from Open Weather
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(apikey!)&units=metric"
    
    //Delegate Variable if any class wants to trigger it
    var delegate: WeatherManagerDelegate?
    
    //Fetches the weather by the City Name
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    //Fetches the weather by the Latitude and Longitude
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    //URL Session
    func performRequest(with urlString: String){
        // 1) Create a URL
        let url = URL(string: urlString)
        
        // 2) Create URL Session
        let session = URLSession(configuration: .default)
        
        // 3) Give Session a Task
        let task = session.dataTask(with: url!, completionHandler: handle(data:  response:  error:  ))
        
        // 4) Start the task
        task.resume()
    }
    //Handler for URL Session
    func handle(data: Data?, response: URLResponse?, error: Error?){
        if error != nil{
            delegate?.didFailedWithError(error: error!)
            return
        }
        
        if let safeData = data {
            if let weather = parseData(safeData){
                //Delegate will trigger this line
                delegate?.didUpdateWeather(self, weather: weather)
            }
        }
    }
    
    //Function to Parse the JSON data
    func parseData(_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            //Decodes the date
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let name = decodedData.name
            let temp = decodedData.main.temp
            
            //Initialise the Weather Model
            let weather = WeatherModel(conditionID: id, cityName: name, temperature: temp)
            return weather
            
        } catch{
            //Error Detection
            delegate?.didFailedWithError(error: error)
            return nil
        }
    }
    
}
