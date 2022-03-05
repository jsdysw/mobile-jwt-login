//
//  loginApp.swift
//  login
//
//  Created by jsdysw on 2022/03/02.
//

import SwiftUI

@main
struct loginApp: App {
    @StateObject var authentication = Authentication()
    
    var body: some Scene {
        WindowGroup {
            if authentication.isLoggedin {
                ContentView()
                    .environmentObject(authentication)
            } else {
                Login()
                    .environmentObject(authentication)
            }
        }
    }
}
