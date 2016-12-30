//
//  CurrentWeather.swift
//  RainyCloud
//
//  Created by Tosin Peters on 2016-12-29.
//  Copyright © 2016 Tosin Peters. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp:Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        
        return _cityName
    }
    
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: DownloadComplete) {
        //tell alamofire where to download from
        let currentUrl = URL(string: CURRENT_WEATHER_URL)!
        
        Alamofire.request(currentUrl).responseJSON { response in
            //we've saved the JSON that we want here
            let result = response.result

            if let dict = result.value as? Dictionary<String,AnyObject> {
                if let name = dict["name"] as? String {
                    //makes sure the first letter of the name is capitalized
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                //Our weather data comes in form of an dictionary of an array of dictionaries
                if let weather = dict["weather"] as? [Dictionary<String,AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String,AnyObject> {
                    if let currentTemperature = main["temp"]  as? Double {
                        let kelvinToCelsius = currentTemperature - 273.15
                        
                        self._currentTemp = kelvinToCelsius
                        print(self._currentTemp)
                    }
                }
            }
        }
        
        completed()
        
        
    }
}





















