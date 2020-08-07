//
//  ContactsTabView.swift
//  TabViewExample
//

import SwiftUI

struct ContactsTabView: View {
    
    var body: some View {
        ContactsContainer()
            .tabItem {
                Image(systemName: "cart")
                Text("Купить")
        }
        .tag(TabTag.contacts)
    }
}

struct ContactsContainer: View {
    
    @State private var isShowModal = false
    
    var body: some View {
        VStack {
            Text("Контакты офиса")
                .padding(.top)
            Text("тел 8-999-XXX-XXXX")
                .font(.caption)
            Spacer()
            Button(action: {
                 self.isShowModal.toggle()
              }) {
                    Text("Условия доставки")
                 }
                .padding(.bottom)
                .sheet(isPresented: $isShowModal) {
                    ContactsModalView()
                }
        }
    }
}

struct ContactsModalView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Закрыть")
                }
                .padding()
            }
            Spacer()
            Text("Условия доставки")
            Spacer()
        }
    }
}

struct ContactsTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsTabView()
    }
}
