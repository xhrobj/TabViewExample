//
//  ProductsTab.swift
//  TabViewExample
//

import SwiftUI

struct ProductsTabView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        ProductsContainer()
            .tabItem {
                Image(systemName: "tray.2")
                Text("Товары")
            }
            .onDisappear {
                self.router.hideSearchProduct()
            }
            .tag(TabTag.products)
    }
}

struct ProductsContainer: View {
    
    @EnvironmentObject var productsViewModel: ProductsViewModel
    @EnvironmentObject var router: Router
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                if router.isShowSearchProduct {
                    TextField("Поиск", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                }
                NavigationLink(destination: SalesView(), isActive: $router.isShowSalesInfo) {
                    Text("Акции! Распродажи!")
                }
                ProductList(products: productsViewModel.products)
            }
            .navigationBarTitle("Товары")
        }
    }
}

struct ProductList: View {
    
    let products: [Product]
    
    var body: some View {
        List(products, id: \.title, rowContent: renderRow)
    }
    
    func renderRow(product: Product) -> some View {
        NavigationLink(destination: ProductDetailContainer(product: product)) {
            Text(product.title)
        }
        .isDetailLink(true)
    }
}

struct SalesView: View {
    
    var body: some View {
        Text("Акции! Распродажи!")
    }
}

struct ProductDetailContainer: View {
    
    let product: Product?
    
    var body: some View {
        Text(product?.title ?? "")
    }
}
