//
//  Authentication.swift
//  login
//
//  Created by jsdysw on 2022/03/06.
//

import SwiftUI

class Authentication: ObservableObject {
    @Published var isLoggedin = false
    @Published var accesstoken: String = ""
    @Published var refreshtoken: String = ""
    @Published var email: String = ""
    
    func updateValidation(success: Bool) {
        withAnimation{
            isLoggedin = success
        }
    }
}
