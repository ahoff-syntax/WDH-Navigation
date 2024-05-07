//
//  SheetView.swift
//  WDH-Navigation
//
//  Created by Anna Hoff on 06.05.24.
//

import SwiftUI

struct SheetView: View {
    
    @ObservedObject var viewModel: NavigationViewModel
    
    var body: some View {
        
        Button(action: {viewModel.logOut()}, label: {
            Text("Logout")
        })
        
    }
}

#Preview {
    SheetView(viewModel: NavigationViewModel())
}
