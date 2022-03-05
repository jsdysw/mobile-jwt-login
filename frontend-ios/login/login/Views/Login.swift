//
//  Login.swift
//  login
//
//  Created by jsdysw on 2022/03/02.
//

import SwiftUI

struct Login: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack (alignment : .center, spacing: 50) {
            
            HStack {
                Image(systemName: "person")
                TextField("email", text: $email)
                    .keyboardType(.emailAddress)
                    .padding()
                    .cornerRadius(20.0)
            }
            .frame(width: 350, height: 50)
            
            HStack {
                Image(systemName: "square.and.pencil")
                SecureField("password", text:$password)
                    .padding()
                    .cornerRadius(20.0)
            }
            .frame(width: 350, height: 50)

            
            Button(action: {
                login(email: email, password: password)
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
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
