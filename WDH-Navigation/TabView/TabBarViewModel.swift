//
//  TabBarViewModel.swift
//  WDH-Navigation
//
//  Created by Anna Hoff on 06.05.24.
//

import Foundation

class TabBarViewModel: ObservableObject {
    @Published var counter: Int = 0
    @Published var badge: Bool = false
    @Published var letters: [String] = ["a", "b", "c"]
    
    func incrementCounter() {
        counter += 1
    }
    
    func toggleBadge() {
        badge.toggle()
    }
}
