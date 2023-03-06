//
//  NetworkConstant.swift
//  NetworkLayer
//
//  Created by Kartik Gupta on 02/03/23.
//

import Foundation

public typealias StatusCode = Int
public typealias RequestHeaders = [String: String]
public typealias RequestParameters = [String : Any?]

var kTimeoutInterval: TimeInterval = 30.0
var kNetworkEnvironment: Environment = .development
var kRequestCachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalCacheData


