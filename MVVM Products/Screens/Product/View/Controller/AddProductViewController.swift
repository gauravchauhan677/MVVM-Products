//
//  AddProductViewController.swift
//  MVVM Products
//
//  Created by Gaurav Chauhan on 16/01/23.
//

import UIKit



//struct ProductResponse: Decodable {
//    let id: Int
//    let title: String
//}

class AddProductViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addProducts()
    }
    
    
    func addProducts() {
        guard let url = URL(string: "https://dummyjson.com/products/add") else { return }
        
        let parameters = AddProduct(title: "BMW Car")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        //Model to data convert(JSONEncoder() + Encodable)
        request.httpBody = try?JSONEncoder().encode(parameters)
        
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json"
        ]
        
        URLSession.shared.dataTask(with: request) { data, URLResponse, error in
            guard let data else { return }
            do {
                // Data to model convert - JSONDecoder() + Decodable
                let productResponse = try JSONDecoder().decode(AddProduct.self, from: data)
                print(productResponse)
                
            } catch {
                print(error)
            }
        }.resume()
        
    }
    
    
}
