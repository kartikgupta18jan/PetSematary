//
//  PetTests.swift
//  Pet SemataryTests
//
//  Created by Kartik Gupta on 09/03/23.
//

import XCTest
@testable import Pet_Sematary

final class PetTests: XCTestCase {

    var sut: [Pet]!
    
    override func setUpWithError() throws {
      super.setUp()
      let data = try getData(fromJSON: "pets_list")
      sut = try JSONDecoder().decode([Pet].self, from: data)
    }
    
    override func tearDownWithError() throws {
      sut = nil
      super.tearDown()
    }
    
    func testFirstSongJSONMapping() {
        let firstPet = sut.first!
        XCTAssertEqual(firstPet.title, "Camila Cabello")
        XCTAssertEqual(firstPet.image_url, "https://upload.wikimedia.org/wikipedia/commons/3/32/Ferret_2008.png")
        XCTAssertEqual(firstPet.content_url, "https://en.wikipedia.org/wiki/Ferret")
        XCTAssertEqual(firstPet.date_added, "2018-06-23T19:14:04.027Z")
    }
    
    func testSecondSongJSONMapping() {
      let secondPet = sut[1]
      XCTAssertEqual(secondPet.title, "Camila Cabello & Daddy Yankee")
      XCTAssertEqual(secondPet.image_url, "https://upload.wikimedia.org/wikipedia/commons/3/32/Ferret_2008.png")
      XCTAssertEqual(secondPet.content_url, "https://en.wikipedia.org/wiki/Ferret")
      XCTAssertEqual(secondPet.date_added, "2018-06-23T19:14:04.027Z")
    }
}
