//
//  Signup.swift
//  login
//
//  Created by jsdysw on 2022/03/06.
//

import SwiftUI

struct Signup: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var singupVM = SignupViewModel()

    var body: some View {
        VStack (alignment : .center, spacing: 50) {
            HStack {
                Image(systemName: "person")
                TextField("email", text: $singupVM.email)
                    .keyboardType(.emailAddress)
                    .padding()
                    .cornerRadius(20.0)
            }
            .frame(width: 350, height: 50)
            
            HStack {
                Image(systemName: "person")
                TextField("nickname", text: $singupVM.nick)
                    .padding()
                    .cornerRadius(20.0)
            }
            .frame(width: 350, height: 50)
            
            HStack {
                Image(systemName: "square.and.pencil")
                SecureField("password", text: $singupVM.password)
                    .padding()
                    .cornerRadius(20.0)
            }
            .frame(width: 350, height: 50)

            
            Button(action: {
//                singupVM.singup()
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Sign up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(15.0)
            }
        }
        
        .autocapitalization(.none)
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
            .environmentObject(Authentication())
    }
}
