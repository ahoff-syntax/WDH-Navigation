//
//  DetailScreen.swift
//  WDH-Navigation
//
//  Created by Anna Hoff on 06.05.24.
//

import SwiftUI

struct DetailScreen: View {
    
    @ObservedObject var viewModel: NavigationViewModel
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Text("Username: \(viewModel.currentUser.name)")
                Text("Alter: \(viewModel.currentUser.age)")
            }
        }
    }
}

#Preview {
    DetailScreen(viewModel: NavigationViewModel())
}
