//
//  AnyCodable.swift
//  WeatherApp
//
//  Created by Jegathas Sivanesan on 05/06/2019.
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
