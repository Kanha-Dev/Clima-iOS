//
//  WeatherData.swift
//  Clima
//
//  Created by Kanha Gupta on 01/07/24.

import Foundation

//Structure for JSON Data when Decoding
struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let id: Int
    let description: String
}
