//
//  ProductListViewController.swift
//  MVVM Products
//
//  Created by Gaurav Chauhan on 24/12/22.
//

import UIKit

class ProductListViewController: UIViewController {

    @IBOutlet weak var productTableView: UITableView!
    private var viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()

    }
}

extension ProductListViewController {
    
    func configuration() {
        productTableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        initViewModel()
        observeEvent()
    }
    
    func initViewModel() {
        viewModel.fetchProducts()
    }
    
    //Data Binding
    func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
            
            guard let self else { return }
            
            switch event {
            case .loading:
                //show indicator
                print("Product loading.....")
            case .stopLoading:
                print("Stop loading.....")
                //hide indicator
            case .dataLoaded:
                print("Data loaded....")
                DispatchQueue.main.async {
                    // UI main works done
                    self.productTableView.reloadData()
                }
            case .error(let error):
                print(error)
            }
            
        }
    }
}

extension ProductListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as? ProductCell else {
            return UITableViewCell()
        }
        let product = viewModel.products[indexPath.row]
        cell.product = product
        return cell
    }
    
}
