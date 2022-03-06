//
//  ContentView.swift
//  login
//
//  Created by jsdysw on 2022/03/02.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authentication: Authentication

    var body: some View {
        VStack {
            Text("hi")
            Text(self.authentication.email)
            Button(action: {
                authentication.logout()
            }) {
                Text("log out")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(15.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Authentication(email: "abc"))
    }
}
