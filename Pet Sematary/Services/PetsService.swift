//
//  PetsService.swift
//  MVVMExample
//
//  Created by John Codeos on 06/19/20.
//

import Foundation

protocol PetsServiceProtocol {
    func getPets(completion: @escaping (_ success: Bool, _ results: Pet?, _ error: String?) -> ())
}

class PetsService: PetsServiceProtocol {
    func getPets(completion: @escaping (Bool, Pet?, String?) -> ()) {
        HttpRequestHelper().GET(url: "https://raw.githubusercontent.com/johncodeos-blog/MVVMiOSExample/main/demo.json", params: ["": ""], httpHeader: .application_json) { success, data in
            if success {
                do {
                    let model = try JSONDecoder().decode(Pets.self, from: data!)
                    completion(true, model, nil)
                } catch {
                    completion(false, nil, "Error: Trying to parse Employees to model")
                }
            } else {
                completion(false, nil, "Error: Employees GET Request failed")
            }
        }
    }
    
    func getPets(fileName:String, completion: @escaping (Bool, Pet?, String?) -> ()) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Pets.self, from: data)
                completion(true, jsonData.pets, nil)
            } catch {
                completion(false, nil, "Error: Trying to parse Employees to model")
            }
        }
        completion(false, nil, "Error: Employees GET Request failed")
    }

}
