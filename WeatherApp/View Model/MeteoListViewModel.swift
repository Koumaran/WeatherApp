//
//  MeteoListViewModel.swift
//  WeatherApp
//
//  Created by Jegathas Sivanesan on 04/06/2019.
//  Copyright © 2019 Sivanesan. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

protocol MeteoListViewModelDelegate {
	func reloadTableView()
}

public class MeteoListViewModel {
	var meteoTab: [String: Meteo]
	var delegate: MeteoListViewModelDelegate?
	
	/*
		init the meteoListViewModel
		we check if data is already in Realm or else we fetch the API
	*/
	init(delegate: MeteoListViewModelDelegate?) {
		self.delegate = delegate
		meteoTab = [String: Meteo]()
		// First fetch Data in Realm
		let realm = try! Realm()
		let meteoList = realm.objects(MeteoRealm.self)
		if meteoList.count > 0 {
			meteoList.forEach { meteoR in
				let meteo = Meteo(temperature: Temperature(twoM: 0, sol: meteoR.temperatureSol, hPa500: 0, hPa850: 0),
								  pression: Pression(niveauDeLaMer: meteoR.pression),
								  pluie: meteoR.pluie,
								  pluieConvective: meteoR.pluieConvective,
								  humidite: Humidite(twoM: meteoR.humidite),
								  ventMoyen: Vent(tenM: meteoR.ventMoyen),
								  ventRafales: Vent(tenM: meteoR.ventRafales),
								  ventDirection: Vent(tenM: meteoR.ventDirection),
								  isoZero: meteoR.isoZero,
								  risqueNeige: meteoR.risqueNeige,
								  cape: meteoR.cape,
								  nebulosite: Nebulosite(haute: meteoR.nebuHaute, moyenne: meteoR.nebuMoyenne, basse: meteoR.nebuBasse, totale: meteoR.nebuTotale))
				meteoTab["\(meteoR.name)"] = meteo
			}
		} else {
			APIRepository.shared.fetchMeteo { (meteo, error) in
				guard error == nil else {
					fatalError("can't Fetch data")
				}
				self.meteoTab = meteo
				delegate?.reloadTableView()
				// let save the data to Realm
				let realm = try! Realm()
				self.meteoTab.forEach({ (arg) in
					let (key, value) = arg
					let meteoRealm = MeteoRealm.buildMeteoRealm(meteo: value, name: key)
					try! realm.write {
						realm.add(meteoRealm)
					}
				})
			}
		}
	}
}

