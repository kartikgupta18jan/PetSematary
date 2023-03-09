//
//  Pets.swift
//  Pet Sematary
//
//  Created by Kartik Gupta on 02/03/23.
//

import Foundation

struct Pets: Decodable {
    var pets: [Pet]
}
struct Pet : Decodable {
    var image_url: String
    var title: String
    var content_url: String
    var date_added: String

}
