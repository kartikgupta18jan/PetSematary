//
//  CustomStringConvertible+Codable.swift
//  NetworkLayer
//
//  Created by Kartik Gupta on 02/03/23.
//

import Foundation


extension CustomStringConvertible where Self: Codable {
    var description: String {
        var description = "\n \(type(of: self)) \n"
        let selfMirror = Mirror(reflecting: self)
        for child in selfMirror.children {
            if let propertyName = child.label {
                description += "\(propertyName): \(child.value)\n"
            }
        }
        return description
    }
}
