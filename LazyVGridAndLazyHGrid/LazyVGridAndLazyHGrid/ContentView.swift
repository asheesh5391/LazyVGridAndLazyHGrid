//
//  ContentView.swift
//  LazyVGridAndLazyHGrid
//
//  Created by Asheesh Kumar Verma on 25/08/22.
//

import SwiftUI

struct ContentView: View {
    @State private var flavors = [Flavor]()
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(flavors, id: \.self) { item in
                        VStack(spacing: 20) {
                            Image(item.name)
                            Text(item.name)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("Today's Flavors")
        }
        .onAppear(perform: getFlavors)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    func getFlavors() {
        self.flavors = [Flavor(name: "Chocolate"),
                        Flavor(name: "Vanilla"),
                        Flavor(name: "Strawberry"),
                        Flavor(name: "Mint Chip"),
                        Flavor(name: "Pistachio")
        ]
    }
}
