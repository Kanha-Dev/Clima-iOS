//
//  ViewController.swift
//  Clima
//
//  Created by Kanha Gupta on 01/09/2019.

import UIKit
import CoreLocation
class WeatherViewController: UIViewController{
    
    //IBOutlet for Buttons and Label
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    //Variable Declaration
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    //ViewDidLoad Function
    override func viewDidLoad() {
        super.viewDidLoad()
        //For Location Detection
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        //Delegates
        searchTextField.delegate = self
        weatherManager.delegate = self
    }
    //This is the API Key for Open Weather
    //API = e5cf6ea74c5cdb4ac0decb93e48de71d
    
    //Location Pressed Action
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
}

//MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate{
    //Search Field Method
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
    //Return with the keyboard Key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    //textField is not a made up outlet, it will trigger any TextField that triggers it
    
    //Checks if the user type something or not
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        } else{
            textField.placeholder = "Type Something!!"
            return false
        }
    }
    
    //Sets up the rest of the things after the search field is done editing
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //Use seachTextField.text to get the weather for the city.
        let city = searchTextField.text ?? "London"
        weatherManager.fetchWeather(cityName: city)
        
        //Set SearchTextField Value to Default
        searchTextField.text =  ""
    }
    
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate{
    
    //Updates all the label
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        //DispatchQueue is used because URL sessions can take time to process
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
    }
    
    //If error occurs it prints to the console
    func didFailedWithError(error: Error) {
        print(error)
    }
}

//MARK: - Core Location

extension WeatherViewController: CLLocationManagerDelegate{
    //Used to Detech the current Location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("I did it")
        if let location = locations.last{
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    //If error occurs it prints to the console
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
