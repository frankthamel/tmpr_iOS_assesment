//
//  tmprTests.swift
//  tmprTests
//
//  Created by Frank Thamel on 17/10/2019.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import XCTest
@testable import tmpr

class tmprTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCardListModelView_cardAt() {
        
        // initial data
        let card0 = Card(id: "AA0", imageUrl: "Test", job: "Job", jobDescription: "jobDescription", price: 10.0, timeDuration: "10am - 2pm")
        let card1 = Card(id: "AA1", imageUrl: "Test", job: "Job", jobDescription: "jobDescription", price: 10.0, timeDuration: "10am - 2pm")
        let cards : [Card] = [card0,card1]
        let cardListViewModel = CardListViewModel(cards)
        XCTAssertEqual(cardListViewModel.cardAt(0).id, "AA0")
    }
    
    func testCardModelView_jobPrice() {
        
           let price : Float = 10.0
           // initial data
           let card0 = Card(id: "AA0", imageUrl: "Test", job: "Job", jobDescription: "jobDescription", price: price, timeDuration: "10am - 2pm")
           let cards : [Card] = [card0]
           let cardListViewModel = CardListViewModel(cards)
        XCTAssertEqual(cardListViewModel.cardAt(0).price, "$\(price)")
       }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
