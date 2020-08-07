//
//  Router.swift
//  TabViewExample
//

import Foundation

final class Router: ObservableObject {
    @Published var selectedTab: TabTag = .welcome
    @Published var isShowSearchProduct = false
    @Published var isShowSalesInfo = false
    
    private func select(tab: TabTag) {
        selectedTab = tab
    }
    
    func selectProductsTab() {
        select(tab: .products)
    }
    
    func openSalesInfo() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.selectProductsTab()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.isShowSalesInfo = true
            }
        }
    }
    
    func openSearchProduct() {
        selectProductsTab()
        isShowSearchProduct = true
    }
    
    func hideSearchProduct() {
        isShowSearchProduct = false
    }
}
