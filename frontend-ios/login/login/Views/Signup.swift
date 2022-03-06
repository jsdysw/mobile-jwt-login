//
//  Signup.swift
//  login
//
//  Created by jsdysw on 2022/03/06.
//

import SwiftUI

struct Signup: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var signupVM = SignupViewModel()

    func signup() {
        signupVM.signup { success in
            if (success) {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    var body: some View {
        VStack (alignment : .center, spacing: 50) {
            HStack {
                Image(systemName: "person")
                TextField("email", text: $signupVM.email)
                    .keyboardType(.emailAddress)
                    .padding()
                    .cornerRadius(20.0)
            }
            .frame(width: 350, height: 50)
            
            HStack {
                Image(systemName: "person")
                TextField("nickname", text: $signupVM.nick)
                    .padding()
                    .cornerRadius(20.0)
            }
            .frame(width: 350, height: 50)
            
            HStack {
                Image(systemName: "square.and.pencil")
                SecureField("password", text: $signupVM.password)
                    .padding()
                    .cornerRadius(20.0)
            }
            .frame(width: 350, height: 50)

            
            Button(action: {
                signup()
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
