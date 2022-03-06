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
    @State private var singupView: String? = ""

    
    var body: some View {
        NavigationView {
            VStack (alignment : .center, spacing: 50) {
                HStack {
                    Image(systemName: "person")
                    TextField("email", text: $loginVM.email)
                        .keyboardType(.emailAddress)
                        .padding()
                        .cornerRadius(20.0)
                }
                .frame(width: 350, height: 50)
                
                HStack {
                    Image(systemName: "square.and.pencil")
                    SecureField("password", text:$loginVM.password)
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
                
               
                NavigationLink(destination: Signup().environmentObject(authentication), tag: "signup", selection: $singupView) {
                    Button(action: {
                        self.singupView = "signup"
                    }) {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.blue)
                            .cornerRadius(15.0)
                    }
                }
            }
            .autocapitalization(.none)
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
