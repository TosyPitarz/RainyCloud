//
//  WeatherVC.swift
//  RainyCloud
//
//  Created by Tosin Peters on 2016-12-28.
//  Copyright © 2016 Tosin Peters. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController , UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var imageHolder: UIImageView!
    @IBOutlet weak var CurrentWeatherLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather = CurrentWeather()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
        //print(CURRENT_WEATHER_URL)
        currentWeather.downloadWeatherDetails {
            //Setup the UI to load downloaded data
            self.updateMainUI()
        }
        
    }

    
    //MARK: Required delegates methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        return cell
    }
    
    
    func updateMainUI() {
        dateLabel.text = currentWeather.date
        temperatureLabel.text = "\(currentWeather.currentTemp)"
        cityLabel.text = currentWeather.cityName
        CurrentWeatherLabel.text = currentWeather._weatherType
        imageHolder.image = UIImage(named: currentWeather.weatherType)
    }
}

