//
//  Constants.swift
//  RainyCloud
//
//  Created by Tosin Peters on 2016-12-29.
//  Copyright © 2016 Tosin Peters. All rights reserved.
//

import Foundation

//let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?q=winnipeg&appid=1f0057b6b2de1d317ee9ccf785c47b23"
let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"

let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "1f0057b6b2de1d317ee9ccf785c47b23"


typealias DownloadComplete = () -> ()
let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"

