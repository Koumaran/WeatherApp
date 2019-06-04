//
//  Meteo.swift
//  WeatherApp
//
//  Created by Jegathas Sivanesan on 04/06/2019.
//  Copyright © 2019 Sivanesan. All rights reserved.
//

import Foundation


enum AnyCodable: Decodable {
	
	case meteo(Meteo?)
	
	init(from decoder: Decoder) {
		if let meteo = try? decoder.singleValueContainer().decode(Meteo.self) {
			self = .meteo(meteo)
			return
		}
		self = .meteo(nil)
		return
	}
}

struct APIResult: Codable {
	var meteos: [String: Meteo]
	
	private struct CustomCodingKeys: CodingKey {
		var stringValue: String
		init?(stringValue: String) {
			self.stringValue = stringValue
		}
		var intValue: Int?
		init?(intValue: Int) {
			return nil
		}
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CustomCodingKeys.self)
		
		self.meteos = [String: Meteo]()
		for key in container.allKeys {
			let value = try container.decode(AnyCodable.self, forKey: CustomCodingKeys(stringValue: key.stringValue)!)
			switch value {
			case .meteo(let meteo):
				if let m = meteo {
					self.meteos[key.stringValue] = m
				}
			}
		}
	}
}

struct Meteo: Codable {
	let temperature: Temperature?
	let pression: Pression?
	let pluie: Int
	let pluieConvective: Int?
	let humidite: Humidite?
	let ventMoyen: Vent?
	let ventRafales: Vent?
	let ventDirection: Vent?
	let isoZero: Int?
	let risqueNeige: String?
	let cape: Int?
	let nebulosite: Nebulosite?
	
	enum Keys: String, CodingKey {
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
	let twoM: Double?
	let sol: Double?
	let hPa500: Double?
	let hPa850: Double?
	
	enum Keys: String, CodingKey {
		case twoM = "2m"
		case sol
		case hPa500 = "500hPa"
		case hPa850 = "850hPa"
	}
}
struct Pression: Codable {
	let niveauDeLaMer: Int?
	
	enum Keys: String, CodingKey {
		case niveauDeLaMer = "niveau_de_la_mer"
	}
}
struct Humidite: Codable {
	let twoM: Double?
	
	enum Keys: String, CodingKey {
		case twoM = "2m"
	}
}
struct Vent: Codable {
	let tenM: Double?
	
	enum Keys: String, CodingKey {
		case tenM = "10m"
	}
}
struct Nebulosite: Codable {
	let haute: Int?
	let moyenne: Int?
	let basse: Int?
	let totale: Int?
}
