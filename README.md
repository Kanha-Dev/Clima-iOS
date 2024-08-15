
# Weather Forecast App

## Overview
The Weather Forecast App is an iOS application designed to provide users with accurate and up-to-date weather information. This app leverages the OpenWeatherMap API to fetch weather data and uses the iOS Core Location framework to provide location-based weather forecasts. The user interface is designed with a clean and intuitive layout using UIKit, ensuring an easy and seamless user experience.

## Features
- **Real-time Weather Data:** Fetches current weather information for the user’s location using the OpenWeatherMap API.
- **Location Services:** Automatically detects and provides weather information based on the user’s current location.
- **Manual Location Search:** Allows users to manually search for weather information in different cities.
- **Intuitive UI:** Designed with UIKit to offer a user-friendly interface that displays weather data clearly and concisely.
- **Responsive Design:** Optimized for various screen sizes and orientations.

## Technologies Used
- **Swift:** Primary programming language used for iOS development.
- **UIKit:** Used for designing the user interface.
- **Core Location:** Integrated for location services to fetch the user’s current location.
- **OpenWeatherMap API:** Used to retrieve real-time weather data.
- **MVC Architecture:** The app is structured following the Model-View-Controller design pattern for better code organization and maintainability.

## Setup and Installation

### Clone the Repository:
```bash
git clone https://github.com/yourusername/weather-forecast-app.git
```

### Open the Project:
Open `WeatherForecastApp.xcodeproj` in Xcode.

### Install Dependencies:
Ensure all dependencies are installed via Xcode. If you’re using CocoaPods or another dependency manager, run `pod install`.

### API Key Setup:
1. Sign up for an API key from [OpenWeatherMap](https://openweathermap.org/api).
2. Open `Config.swift` and replace `YOUR_API_KEY_HERE` with your actual OpenWeatherMap API key:
```swift
let apiKey = "YOUR_API_KEY_HERE"
```

### Run the App:
Build and run the app on a simulator or a real device.

## Usage
- Upon launching, the app will request permission to access the device's location.
- The current weather for the user’s location will be displayed.
- Users can also search for weather information in different cities using the search bar.

## Screenshots

![Home Screen](screenshots/home_screen.png)
*Home Screen: Displays current weather information.*

![Dark Mode](screenshots/dark_mode.png)
*Dark Mode: Displays current weather information in dark mode.*

## Contributing
If you wish to contribute to the development of this app, please fork the repository and create a pull request. Contributions are welcome!

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact
For any inquiries or issues, please contact [kanhagupta.dev@gmail.com](mailto:kanhagupta.dev@gmail.com).
