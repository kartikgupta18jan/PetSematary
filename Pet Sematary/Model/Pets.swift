//
//  Pets.swift
//  Pet Sematary
//
//  Created by Kartik Gupta on 02/03/23.
//

import Foundation

struct Pets: Decodable {
    var pets: [PetsInfo]
}
struct PetsInfo : Decodable {
    var image_url: String
    var title: String
    var content_url: String
    var date_added: String

}

func loadJson(filename fileName: String) -> [PetsInfo]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(Pets.self, from: data)
            return jsonData.pets
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
