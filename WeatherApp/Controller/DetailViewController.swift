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

		rainningLabel.text = "pluie: \(meteo.pluie)"
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
