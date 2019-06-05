//
//  APIResult.swift
//  WeatherApp
//
//  Created by Jegathas Sivanesan on 05/06/2019.
//  Copyright © 2019 Sivanesan. All rights reserved.
//

import Foundation

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
