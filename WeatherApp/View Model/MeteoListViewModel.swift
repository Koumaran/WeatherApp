//
//  MeteoListViewModel.swift
//  WeatherApp
//
//  Created by Jegathas Sivanesan on 04/06/2019.
//  Copyright © 2019 Sivanesan. All rights reserved.
//

import Foundation

public class MeteoListViewModel {
	var meteoTab: [String: Meteo]
	
	init() {
		meteoTab = [String: Meteo]()
		APIRepository.shared.fetchMeteo { (meteo, error) in
			guard error == nil else {
				fatalError("can't Fetch data")
			}
			self.meteoTab = meteo
		}
	}
}
