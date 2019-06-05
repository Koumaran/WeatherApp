//
//  MeteoRealm.swift
//  WeatherApp
//
//  Created by Jegathas Sivanesan on 05/06/2019.
//  Copyright © 2019 Sivanesan. All rights reserved.
//

import Foundation
import RealmSwift

class MeteoRealm: Object {
	@objc dynamic var pluie: Int = 0
	@objc dynamic var name: String = ""
	@objc dynamic var pluieConvective: Int = 0
	@objc dynamic var isoZero: Int = 0
	@objc dynamic var cape: Int = 0
	@objc dynamic var temperatureSol: Double = 0
	@objc dynamic var pression: Int = 0
	@objc dynamic var humidite:Double = 0
	@objc dynamic var ventMoyen: Double = 0
	@objc dynamic var ventRafales: Double = 0
	@objc dynamic var ventDirection: Double = 0
	@objc dynamic var risqueNeige: String = ""
	@objc dynamic var nebuHaute: Int = 0
	@objc dynamic var nebuMoyenne: Int = 0
	@objc dynamic var nebuBasse: Int = 0
	@objc dynamic var nebuTotale: Int = 0

	
	class func buildMeteoRealm(meteo: Meteo, name: String) -> MeteoRealm {
		let meteoRealm = MeteoRealm()
		meteoRealm.name = name
		meteoRealm.pluie = meteo.pluie
		meteoRealm.pluieConvective = meteo.pluieConvective
		meteoRealm.isoZero = meteo.isoZero
		meteoRealm.cape = meteo.cape
		meteoRealm.temperatureSol = meteo.temperature.sol
		meteoRealm.pression = meteo.pression.niveauDeLaMer
		meteoRealm.humidite = meteo.humidite.twoM
		meteoRealm.ventMoyen = meteo.ventMoyen.tenM
		meteoRealm.ventRafales = meteo.ventRafales.tenM
		meteoRealm.ventDirection = meteo.ventRafales.tenM
		meteoRealm.risqueNeige = meteo.risqueNeige
		meteoRealm.nebuHaute = meteo.nebulosite.haute
		meteoRealm.nebuBasse = meteo.nebulosite.basse
		meteoRealm.nebuMoyenne = meteo.nebulosite.moyenne
		meteoRealm.nebuTotale = meteo.nebulosite.totale
		return meteoRealm
	}
}
