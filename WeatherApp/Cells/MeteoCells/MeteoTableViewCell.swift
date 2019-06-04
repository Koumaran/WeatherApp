//
//  MeteoTableViewCell.swift
//  WeatherApp
//
//  Created by Jegathas Sivanesan on 04/06/2019.
//  Copyright © 2019 Sivanesan. All rights reserved.
//

import UIKit

class MeteoTableViewCell: UITableViewCell {
	@IBOutlet weak var dateLabel: UILabel!
	
	var meteo: Meteo?
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func setupCell(name: String, meteo: Meteo) {
		dateLabel.text = name
		self.meteo = meteo
	}
    
}
