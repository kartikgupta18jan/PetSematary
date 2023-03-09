//
//  PetsService.swift
//  MVVMExample
//
//  Created by John Codeos on 06/19/20.
//

import Foundation

protocol ConfigServiceProtocol {
    func getConfigSetting(fileName:String, completion: @escaping (_ success: Bool, _ results: ConfigSetting?, _ error: String?) -> ())
}

class ConfigService: ConfigServiceProtocol {
    func getConfigSetting(fileName:String, completion: @escaping (Bool, ConfigSetting?, String?) -> ()) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(AppConfig.self, from: data)
                completion(true, jsonData.settings, nil)
            } catch {
                completion(false, nil, "Error: Trying to parse Config to model")
            }
        }
        completion(false, nil, "Error: Config GET Request failed")
    }

}
