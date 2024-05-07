//
//  HomeScreen.swift
//  WDH-Navigation
//
//  Created by Anna Hoff on 06.05.24.
//



import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject var viewModel: NavigationViewModel
    
    var body: some View {
        
        NavigationStack {
            VStack {
                ForEach(viewModel.users, id: \.name) {user in
                    
                    //mittels onAppear können bei Klick auf einen Navigationlink zusätzlich actions ausgeführt werden
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
                }
            }
            
            //Sheets präsentieren eine neue View über eine existierende, ohne diese vollständig zu verstecken
            .sheet(isPresented: $viewModel.showSheet, content: {
                SheetView(viewModel: viewModel)
            })
        }
    }
}

#Preview {
    HomeScreen(viewModel: NavigationViewModel())
}
