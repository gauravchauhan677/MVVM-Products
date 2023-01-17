//
//  ProductEndPoint.swift
//  MVVM Products
//
//  Created by Gaurav Chauhan on 17/01/23.
//

import Foundation

enum ProductEndPoint {
    case products // GET
    case carts
    case addProducts(produt: AddProduct) //POST
}

extension ProductEndPoint: EndPointType {
    var path: String {
        switch self {
        case .products:
            return "products"
        case .carts:
            return "carts"
        case .addProducts:
            return "products/add"
        }
    }
    
    var baseURL: String {
        switch self {
        case .products:
            return "https://fakestoreapi.com/"
        case .carts:
            return "https://fakestoreapi.com/"
        case .addProducts:
            return "https://dummyjson.com/"
        }
        
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethods {
        switch self {
        case .products:
            return .get
        case .carts:
            return .get
        case .addProducts:
            return .post
        }
    }
    
    //post
    
    var body: Encodable? {
        switch self {
        case .products:
            return nil
        case .carts:
            return nil
        case .addProducts(let produt):
            return produt
        }
    }
    
    var headers: [String : String]? {
        return APIManager.commonHeaders
    }
    
}
