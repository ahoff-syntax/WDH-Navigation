//
//  LogInView.swift
//  WDH-Navigation
//
//  Created by Anna Hoff on 06.05.24.
//

import SwiftUI

struct LogInView: View {
    
    @StateObject var viewModel: NavigationViewModel = NavigationViewModel()
    
    var body: some View {
        VStack{
            Text("Bitte loggen Sie sich ein: ")
            TextField("Username: ", text: $viewModel.inputUser)
            SecureField("Password: ", text: $viewModel.inputPassword)
            
            Button(action: {viewModel.checkLogin()}, label: {
                Text("LogIn")
            })
            
        }
        
        .fullScreenCover(isPresented: $viewModel.isLogginIn, content: {
            HomeScreen(viewModel: viewModel)
        })
        
        
    }
}

#Preview {
    LogInView()
}
