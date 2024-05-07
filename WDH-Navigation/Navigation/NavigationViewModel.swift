//
//  NavigationViewModel.swift
//  WDH-Navigation
//
//  Created by Anna Hoff on 06.05.24.
//

import Foundation

class NavigationViewModel: ObservableObject {
    
    private let password = "123456"
    private let userName = "user123"
    @Published var isLogginIn: Bool = false
    @Published var inputUser: String = ""
    @Published var inputPassword: String = ""
    @Published var showSheet: Bool = false
    @Published var currentUser: User = User(name: "", age: 0)
    
    @Published var users: [User] = [User(name: "user123", age: 50), User(name: "asdf", age: 25), User(name: "qwertz", age: 30)]
    
    func checkLogin() {
        isLogginIn =  inputUser.lowercased() == userName && inputPassword == self.password
    }
    
    func logOut() {
        resetInput()
        isLogginIn = false
        showSheet.toggle()
    }
    
    func toggleShowSheet() {
        showSheet.toggle()
    }
    
    func setUser(user: User) {
        currentUser = user
    }
    
    func resetInput() {
        inputUser = ""
        inputPassword = ""
    }
}


struct User {
    var name: String
    var age: Int
}
