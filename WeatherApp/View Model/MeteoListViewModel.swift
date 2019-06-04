//
//  MeteoListViewModel.swift
//  WeatherApp
//
//  Created by Jegathas Sivanesan on 04/06/2019.
//  Copyright © 2019 Sivanesan. All rights reserved.
//

import Foundation
import UIKit

protocol MeteoListViewModelDelegate {
	func reloadTableView()
}

public class MeteoListViewModel {
	var meteoTab: [String: Meteo]
	var delegate: MeteoListViewModelDelegate
	
	
	init(delegate: MeteoListViewModelDelegate) {
		self.delegate = delegate
		meteoTab = [String: Meteo]()
		APIRepository.shared.fetchMeteo { (meteo, error) in
			guard error == nil else {
				fatalError("can't Fetch data")
			}
			self.meteoTab = meteo
			delegate.reloadTableView()
			
		}
	}
}

