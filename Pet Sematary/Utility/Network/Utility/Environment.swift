//
//  Environment.swift
//  NetworkLayer
//
//  Created by Kartik Gupta on 02/03/23.
//

import Foundation

// MARK: - Environment

/// Find the list environments
public enum Environment: String, CaseIterable {
    case development
    case staging
    case production
}

extension Environment {
    public var url: String {
        switch self {
        case .development:
            return "https://jsonplaceholder.typicode.com/"
        case .staging:
            return "https://jsonplaceholder.typicode.com/"
        case .production:
            return "https://jsonplaceholder.typicode.com/"
        }
    }
}
