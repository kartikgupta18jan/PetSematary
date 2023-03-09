//
//  PetsService.swift
//  MVVMExample
//
//  Created by John Codeos on 06/19/20.
//

import Foundation

protocol PetsServiceProtocol {
    func getPets(fileName:String, completion: @escaping (_ success: Bool, _ results: Pets?, _ error: String?) -> ())
}

class PetsService: PetsServiceProtocol {
    func getPets(fileName:String, completion: @escaping (Bool, Pets?, String?) -> ()) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(PetMain.self, from: data)
                completion(true, jsonData.pets, nil)
            } catch {
                completion(false, nil, "Error: Trying to parse Pets to model")
            }
        }
        completion(false, nil, "Error: Pets GET Request failed")
    }

}
