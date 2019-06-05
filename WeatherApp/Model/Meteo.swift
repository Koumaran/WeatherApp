//
//  Meteo.swift
//  WeatherApp
//
//  Created by Jegathas Sivanesan on 04/06/2019.
//  Copyright © 2019 Sivanesan. All rights reserved.
//

import Foundation
import RealmSwift

struct Meteo: Codable {
	let temperature: Temperature
	let pression: Pression
	let pluie: Int
	let pluieConvective: Int
	let humidite: Humidite
	let ventMoyen: Vent
	let ventRafales: Vent
	let ventDirection: Vent
	let isoZero: Int
	let risqueNeige: String
	let cape: Int
	let nebulosite: Nebulosite

	enum CodingKeys: String, CodingKey {
		case temperature, pression, pluie, humidite, cape, nebulosite
		case pluieConvective = "pluie_convective"
		case ventMoyen = "vent_moyen"
		case ventRafales = "vent_rafales"
		case ventDirection = "vent_direction"
		case isoZero = "iso_zero"
		case risqueNeige = "risque_neige"
	}
	
}

struct Temperature: Codable {
	let twoM: Double
	let sol: Double
	let hPa500: Double
	let hPa850: Double
	
	enum CodingKeys: String, CodingKey {
		case twoM = "2m"
		case sol
		case hPa500 = "500hPa"
		case hPa850 = "850hPa"
	}
	
}
struct Pression: Codable {
	let niveauDeLaMer: Int

	enum CodingKeys: String, CodingKey {
		case niveauDeLaMer = "niveau_de_la_mer"
	}
}
struct Humidite: Codable {
	let twoM: Double

	enum CodingKeys: String, CodingKey {
		case twoM = "2m"
	}
}
struct Vent: Codable {
	let tenM: Double

	enum CodingKeys: String, CodingKey {
		case tenM = "10m"
	}
}
struct Nebulosite: Codable {
	let haute: Int
	let moyenne: Int
	let basse: Int
	let totale: Int
}
