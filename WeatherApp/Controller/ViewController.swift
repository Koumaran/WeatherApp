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
	
	var viewModel: MeteoListViewModel?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.viewModel = MeteoListViewModel(delegate: self)
		
		// register the nib cell to tableView
		let nib = UINib(nibName: "MeteoTableViewCell", bundle: nil)
		tableView.register(nib, forCellReuseIdentifier: "meteoCell")
		tableView.dataSource = self
		tableView.delegate = self
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let destination = segue.destination as? DetailViewController, let tab = viewModel?.meteoTab, let index = tableView.indexPathForSelectedRow?.row {
			destination.meteo = Array(tab.values)[index]
			destination.name = Array(tab.keys)[index]
		}
	}
}

// MARK: TableView DataSource Delegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 50
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel?.meteoTab.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "meteoCell", for: indexPath) as? MeteoTableViewCell,
		let tab = viewModel?.meteoTab else {
			fatalError()
		}
		let key = Array(tab.keys)[indexPath.row]
		let value = Array(tab.values)[indexPath.row]
		cell.setupCell(name: key, meteo:value)
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		performSegue(withIdentifier: "showDetail", sender: self)
//		tableView.deselectRow(at: indexPath, animated: true)
	}
}

// MARK: Procole
extension ViewController: MeteoListViewModelDelegate {
	func reloadTableView() {
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
}
