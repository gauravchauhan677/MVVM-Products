//
//  Carts.swift
//  MVVM Products
//
//  Created by Gaurav Chauhan on 31/12/22.
//

import Foundation


// MARK: - WelcomeElement
struct WelcomeElement: Codable {
   
    let id: Int
    let userId: Int
    let date: String
    let products: [products]
    
}
struct products: Codable {
    let productId: Int
    let quantity: Int
}

//struct Product: Decodable {
//    let id: Int
//    let title: String
//    let price: Double
//    let description: String
//    let category: String
//    let image: String
//    let rating: Rate
//}
//
//struct Rate: Decodable {
//    let rate: Double
//    let count: Int
//}
