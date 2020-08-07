//
//  WelcomeTab.swift
//  TabViewExample
//

import SwiftUI

struct WelcomeTab: View {
    @EnvironmentObject var router: Router
    
    private var welcomeView: some View {
        VStack {
            Text("Товары")
                .onTapGesture {
                    self.router.selectProductsTab()
            }
            Text("Поиск товара")
                .onTapGesture {
                    self.router.openSearchProduct()
            }
            .padding()
            Text("Акции")
                .onTapGesture {
                    self.router.openSalesInfo()
            }
        }
    }
    
    var body: some View {
        welcomeView
            .tabItem {
                Image(systemName: "folder")
                Text("Welcome")
        }
        .tag(TabTag.welcome)
    }
}
