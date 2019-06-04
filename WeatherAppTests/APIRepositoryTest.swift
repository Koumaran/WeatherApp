//
//  APIRepositoryTest.swift
//  WeatherAppTests
//
//  Created by Jegathas Sivanesan on 04/06/2019.
//  Copyright © 2019 Sivanesan. All rights reserved.
//

import XCTest
import WeatherApp

class APIRepositoryTest: XCTestCase {
	
	let apiContainer = APIRepository.shared

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
	/*
	Test the APIRepository FetchMeteo(callBack: (data) -> Void)
	Success: Should return a tab of Meteo and error to nil
	*/
	func testMeteoApiCall() {
		let expectation = XCTestExpectation(description: "Fetch data from www.infoclimat.fr")
		
		apiContainer.fetchMeteo { meteoTab, error  in
			// Make sure we got some data.
			XCTAssertNil(error, "There is an Error: \(error!)")
			
			XCTAssertTrue(!meteoTab.isEmpty)
			// Fulfill the expectation to indicate that the background task has finished successfully.
			expectation.fulfill()
		}
		wait(for: [expectation], timeout: 10.0)
	}
	
	func testMeteoListViewModel() {
		let expectation = XCTestExpectation(description: "Call fetchMeteo and convert result to MeteoListViewModel")
		let meteoList = MeteoListViewModel(tableView: UITableView(frame: CGRect.zero))
		sleep(5)
		let list = meteoList.meteoTab
		XCTAssertNotNil(list)
		XCTAssertTrue(!list.isEmpty)
		expectation.fulfill()
	}

}
