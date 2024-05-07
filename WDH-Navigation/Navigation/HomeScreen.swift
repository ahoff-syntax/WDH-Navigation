//
//  HomeScreen.swift
//  WDH-Navigation
//
//  Created by Anna Hoff on 06.05.24.
//

//NavigationStack für tiefere Navigation
//neue Fenster öffnen sich von rechts nach links
//erreichbar über Navigationlink

import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject var viewModel: NavigationViewModel
    
    var body: some View {
        
        NavigationStack {
            VStack {
                ForEach(viewModel.users, id: \.name) {user in
                    NavigationLink(user.name) {
                        DetailScreen(viewModel: viewModel)
                            .onAppear(perform: {
                                viewModel.setUser(user: user)
                            })
                    }
                }
            }
            .navigationTitle("HomeScreen")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    
                    Button(action: {viewModel.toggleShowSheet()}, label: {
                        Image(systemName: "gear")
                    })
                }}
            .sheet(isPresented: $viewModel.showSheet, content: {
                SheetView(viewModel: viewModel)
            })
        }
        
    }
}

#Preview {
    HomeScreen(viewModel: NavigationViewModel())
}
