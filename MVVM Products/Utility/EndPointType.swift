//
//  EndPointType.swift
//  MVVM Products
//
//  Created by Gaurav Chauhan on 31/12/22.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

protocol EndPointType {
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
    var method: HTTPMethods { get }
    //post
    var body: Encodable? { get }
    var headers: [String: String]? { get }
}


