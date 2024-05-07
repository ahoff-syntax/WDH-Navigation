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
    @StateObject var secondViewModel = NavigationViewModel()
    
    //legt fest, in welchem Tab wir sind
    //Weil selectedTab mit 3 initialisiert wird, startet die App dann auch im 3. Tab
    @State var selectedTab = 3
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            Text("Screen 1")
                .tabItem {
                    Label("Erster", systemImage: "house")
                }
                .badge(viewModel.counter) //Zeigt neben dem Icon in der TabView ein Badge mit dem Counter an
                .tag(1)
            
            VStack {
                Text("Screen 2")
                Button(action: {viewModel.toggleBadge()}, label: {
                    Text("Toggle den Badge")
                })
            }
            .tabItem {
                Label("Zweiter", systemImage: "sun.max")
            }
            .badge(viewModel.badge ? "!" : "?") //Zeigt neben dem Icon in der TabView ein Badge mit dem "?" oder "!" an, abhängig von der Bool Variable badge
            .onAppear(perform: {
                viewModel.incrementCounter()
            }) //beim Navigieren zu diesem Tab wird der Counter um 1 erhöht
            .tag(2)
            
            VStack {
                Text("Screen 3")
                
                //bei Klick auf den Button wird selectedTab auf 4 geändert und zu dem Tab navigiert, der als .tag 4 hat
                Button(action: {selectedTab = 4}, label: {
                    Text("Zu Tab 4")
                })
            }
            .tabItem {
                Label("Dritter", systemImage: "person")
            }
            .badge(":)")
            .tag(3)
            
            Text("Screen 4")
                .tabItem {
                    Label("Vierter", systemImage: "righttriangle")
                }
                .tag(4)
            
            VStack {
                Text("Screen 5")
                
                //erstellt und eine weitere TabView innerhalb eines Tabs
                TabView {
                    ForEach(viewModel.letters, id: \.self) { letter in
                        Text(letter)
                    }
                }
                //mittels PageStyle legen wir fest, dass wir durch swipen statt mit der TabBar unsere Views wechseln wollen
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
            .tabItem {
                Label("Fünfter", systemImage: "location")
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
        
        // .tabViewStyle(.page)
        //.indexViewStyle(.page(backgroundDisplayMode: .always))
        
    }
}

#Preview() {
    TabBar()
}
