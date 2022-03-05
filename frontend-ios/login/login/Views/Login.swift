//
//  Login.swift
//  login
//
//  Created by jsdysw on 2022/03/02.
//

import SwiftUI

struct Login: View {
    @EnvironmentObject var authentication: Authentication
    @State private var loginVM = LoginViewModel()
    
    var body: some View {
        VStack (alignment : .center, spacing: 50) {
            HStack {
                Image(systemName: "person")
                TextField("email", text: $loginVM.credentials.email)
                    .keyboardType(.emailAddress)
                    .padding()
                    .cornerRadius(20.0)
            }
            .frame(width: 350, height: 50)
            
            HStack {
                Image(systemName: "square.and.pencil")
                SecureField("password", text:$loginVM.credentials.password)
                    .padding()
                    .cornerRadius(20.0)
            }
            .frame(width: 350, height: 50)

            
            Button(action: {
                loginVM.login(authentication: authentication)
            }) {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(15.0)
            }
            
            Button(action: {}) {
                Text("Sign up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(15.0)
            }
        }
        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
