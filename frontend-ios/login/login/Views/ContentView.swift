//
//  ContentView.swift
//  login
//
//  Created by 윤석원 on 2022/03/02.
//

import SwiftUI

struct ContentView: View {
    @State var email: String = ""
    @State var password: String = ""

    var body: some View {
        VStack (alignment : .center, spacing: 50) {

            TextField("email", text: $email)
                .keyboardType(.emailAddress)
                .padding()
                .cornerRadius(20.0)
                .frame(width: 400, height: 50)
            
            SecureField("password", text:$password)
                .padding()
                .cornerRadius(20.0)
                .frame(width: 400, height: 50)

            
            Button(action: {}) {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
