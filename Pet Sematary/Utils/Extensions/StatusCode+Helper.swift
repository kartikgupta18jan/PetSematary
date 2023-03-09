//
//  StatusCode+Helper.swift
//  NetworkLayer
//
//  Created by Kartik Gupta on 02/03/23.
//

import Foundation

extension StatusCode {
    var isSuccess: Bool {
        (200..<300).contains(self)
    }
}
