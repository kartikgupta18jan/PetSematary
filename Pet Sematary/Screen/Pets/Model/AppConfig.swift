//
//  AppConfig.swift
//  Pet Sematary
//
//  Created by Kartik Gupta on 09/03/23.
//

import Foundation

struct AppConfig : Decodable {
    var settings: ConfigSetting
}

struct ConfigSetting : Decodable {
    var workHours: String
}

