//
//  ProductsViewModel.swift
//  TabViewExample
//

import Foundation

final class ProductsViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    
    init() {
        let dictionaryList = loadData()
        if let products = dictionaryList?
            .map ({ Product(dictionary: $0) })
            .sorted (by: { $0.title.uppercased() < $1.title.uppercased() }) {
                self.products = products
        }
    }
    
    private func loadData() -> [[String:AnyObject]]? {
        guard let path = Bundle.main.path(forResource: "Products", ofType: "plist"),
              let dictionaryList = NSArray(contentsOfFile: path) else {
                return nil
        }
        
        return dictionaryList as? [[String:AnyObject]]
    }
}
