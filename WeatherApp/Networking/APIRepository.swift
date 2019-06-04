//
//  APIRepository.swift
//  WeatherApp
//
//  Created by Jegathas Sivanesan on 04/06/2019.
//  Copyright © 2019 Sivanesan. All rights reserved.
//

import Foundation

class APIRepository {
	static let shared: APIRepository = APIRepository()
	
	let route: String = "http://www.infoclimat.fr/public-api/gfs/json?_ll=48.85341,2.3488&_auth=UUtWQVUrXX9VeAE2BnABKAVtATQKfAEmBnoCYQxpAn9ROgJjVjZdO1Q6B3oGKQs9Ay5VNggzCDhXPApyXy1VNFE7VjpVPl06VToBZAYpASoFKwFgCioBJgZsAmUMfwJnUTECeFY3XT1UMwd7BjcLPgM3VSoIKAgxVzEKaF87VTBRN1Y6VTBdO1U6AXwGKQEwBWUBNwozATEGZQJsDGECYlFmAmFWNl0%2FVDMHewY2Cz0DMVU9CD4INVc0Cm5fLVUpUUtWQVUrXX9VeAE2BnABKAVjAT8KYQ%3D%3D&_c=9ab44722ff6006c1375446e6d0cf0307"
	
	
	// MARK: Public func
	func fetchMeteo(_ callBack: @escaping (_ meteoTab: [String: Meteo], _ errMessage: String?) -> Void) {
		guard let url = URL(string: route) else {
			callBack([:], "url can't be created")
			return
		}
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			guard error == nil, let data = data else {
				callBack([:], error.debugDescription)
				return
			}
			do {
				let decoder = JSONDecoder()
				let result = try decoder.decode(APIResult.self, from: data)
				callBack(result.meteos, nil)
			} catch let err {
				callBack([:], err.localizedDescription)
			}
		}.resume()
	}
}
