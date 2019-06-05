//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Jegathas Sivanesan on 05/06/2019.
//  Copyright © 2019 Sivanesan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	// MARK: Outlet
	@IBOutlet weak var rainningLabel: UILabel!
	
	// MARK: Properties
	var meteo: Meteo!
	var name: String!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		rainningLabel.text = """
		temperature: sol: \(meteo.temperature.sol)
		pression: niveau_de_la_mer \(meteo.pression.niveauDeLaMer)
		pluie: \(meteo.pluie)
		pluie_convective: \(meteo.pluieConvective)
		humidite: 2m \(meteo.humidite.twoM)
		vent_moyen: 10m \(meteo.ventMoyen)
		vent_rafales: 10M \(meteo.ventRafales)
		vent_direction: 10m \(meteo.ventDirection)
		iso_zero: \(meteo.isoZero)
		risque_neige: \(meteo.risqueNeige)
		cape: \(meteo.cape)
		nebulosite: [haute: \(meteo.nebulosite.haute) moyenne: \(meteo.nebulosite.moyenne)
		basse: \(meteo.nebulosite.basse) totale: \(meteo.nebulosite.totale) ]
		"""
		navigationItem.title = name
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
