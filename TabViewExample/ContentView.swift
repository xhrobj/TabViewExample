//
//  ContentView.swift
//  TabViewExample
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabViewContainer()
    }
}

struct TabViewContainer: View {

    @EnvironmentObject var router: Router
    
    var body: some View {
        TabView(selection: $router.selectedTab) {
            WelcomeTab()
            ProductsTabView()
            ContactsTabView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
