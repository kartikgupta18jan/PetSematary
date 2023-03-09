//
//  Pet_SemataryTests.swift
//  Pet SemataryTests
//
//  Created by Kartik Gupta on 02/03/23.
//

import XCTest
@testable import Pet_Sematary

final class Pet_SemataryTests: XCTestCase {
    private var petService: PetsServiceProtocol!

    var petListVM:PetsViewModel?
    
    override func setUp() {
        super.setUp()
        petListVM = PetsViewModel(petsService: petService)
    }
    
    override func tearDown() {
        super.tearDown()
        petListVM = nil
    }
    
    func testFetchPets() async throws{
        try petListVM?.fetchData(pets: petListVM?.pets!)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   

}
