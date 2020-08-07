//
//  Product.swift
//  TabViewExample
//

import Foundation

struct Product {
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    init(dictionary: [String : AnyObject]) {
        let title  = dictionary["title"] as? String ?? ""
        self.init(title: title)
    }
}
