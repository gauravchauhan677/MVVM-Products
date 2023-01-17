//
//  ProductViewModel.swift
//  MVVM Products
//
//  Created by Gaurav Chauhan on 24/12/22.
//

import Foundation

final class ProductViewModel {
    
    var products: [Product] = []
    var carts: [WelcomeElement] = []
    
    var eventHandler: ((_ event: Event) -> Void)? // Data Binding closore
    
    func fetchProducts() {
        self.eventHandler?(.loading)
        APIManager.shared.request(
            modelType: [Product].self,
            type: ProductEndPoint.products) { response in
                    self.eventHandler?(.stopLoading)
                    switch response {
                    case .success(let products):
                        self.products = products
                        self.eventHandler?(.dataLoaded)
                    case .failure(let error):
                        self.eventHandler?(.error(error))
                    }
            }
    }
    
    func fetchCarts() {
        
        APIManager.shared.request(
            modelType: [WelcomeElement].self,
            type: ProductEndPoint.carts) { response in
                switch response {
                case .success(let carts):
                    self.carts = carts
                    print(carts)
                case .failure(let error):
                    print(error)
                }
            }
        
    }
    
    func addProduct(parameter: AddProduct) {
        APIManager.shared.request(
            modelType: AddProduct.self, // response type
            type: ProductEndPoint.addProducts(produt: parameter)) { result in
                switch result {
                case .success(let product):
                    self.eventHandler?(.newProductAdded(product: product))
                case .failure(let error):
                    self.eventHandler?(.error(error))
                }
            }
    }
    
    
    /*
    func fetchProducts() {
        self.eventHandler?(.loading)
        APIManager.shared.fetchProducts { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let products):
                self.products = products
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
     */
    
}

extension ProductViewModel {
    
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
        case newProductAdded(product: AddProduct)
    }
    
}
