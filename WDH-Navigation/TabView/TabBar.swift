//
//  TabBar.swift
//  WDH-Navigation
//
//  Created by Anna Hoff on 06.05.24.
//

import Foundation
import SwiftUI

struct TabBar: View {
    
    @StateObject var viewModel = TabBarViewModel()
    @State var selectedTab = 3
    
    var body: some View {
        NavigationStack{
            TabView(selection: $selectedTab) {
                Text("Screen 1")
                    .tabItem {
                        Label("Erster", systemImage: "house")
                    }
                    .badge(viewModel.counter)
                    .onAppear(perform: {
                        viewModel.incrementCounter()
                    })
                    .tag(1)
                
                VStack {
                    Text("Screen 2")
                    Button("Toggle den Badge") {
                        viewModel.toggleBadge()
                    }
                }
                        .tabItem {
                            Label("Zweiter", systemImage: "sun.max")
                        }
                    .badge(
                        viewModel.badge ? "!" : "?"
                    )
                    .tag(2)
                
                VStack {
                    Text("Screen 3")
                    Button(action: {selectedTab = 4}, label: {
                        Text("Zur 4")
                    })
                }
                    .tabItem {
                        Label("Dritter", systemImage: "person")
                    }
                    .tag(3)
                
                Text("Screen 4")
                    .tabItem {
                        Label("Vierter", systemImage: "righttriangle")
                    }
                    .tag(4)
                
                VStack {
                    Text("Screen 5")
                    TabView {
                        ForEach(viewModel.letters, id: \.self) { letter in
                            Text(letter)
                        }
                    }
                    .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                }
                .tabItem {
                    Label("Fünfter", systemImage: "clock")
                }
                .tag(5)
                
                
                Text("Screen 6")
                    .tabItem {
                        Label("Sechster", systemImage: "snowflake.circle")
                    }
                    .tag(6)
                Text("Screen 7")
                    .tabItem {
                        Label("Siebter", systemImage: "location")
                    }
                    .tag(7)
            }
        }
       // .tabViewStyle(.page)
    }
}

#Preview() {
    TabBar()
}
