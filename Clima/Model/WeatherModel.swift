//
//  WeatherModel.swift
//  Clima
//
//  Created by Kanha Gupta on 02/07/24.

import Foundation

//Weather Database that we will be using and updating
struct WeatherModel {
    let conditionID: Int
    let cityName: String
    let temperature: Double
    //Computed Variable
    var conditionName: String{
        getConditionName(weatherID: conditionID)
    }
    
    //Computed Variable
    var temperatureString: String{
        String(format: "%.1f", temperature)
    }
    //Function to compute the condition name
    func getConditionName(weatherID : Int) -> String {
        switch weatherID {
                case 200...232:
                    return "cloud.bolt"
                case 300...321:
                    return "cloud.drizzle"
                case 500...531:
                    return "cloud.rain"
                case 600...622:
                    return "cloud.snow"
                case 701...781:
                    return "cloud.fog"
                case 800:
                    return "sun.max"
                case 801...804:
                    return "cloud.bolt"
                default:
                    return "cloud"
                }
    }

}
