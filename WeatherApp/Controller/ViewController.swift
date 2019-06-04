//
//  ViewController.swift
//  WeatherApp
//
//  Created by Jegathas Sivanesan on 04/06/2019.
//  Copyright © 2019 Sivanesan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: Propertie
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		// register the nib cell to tableView
		let nib = UINib(nibName: "MeteoTableViewCell", bundle: nil)
		tableView.register(nib, forCellReuseIdentifier: "meteoCell")
		tableView.dataSource = self
		
	}


}


extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "meteoCell", for: indexPath)
		return cell
	}
	
	
}
