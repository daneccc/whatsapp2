//
//  SignupView.swift
//  Whatsapp2
//
//  Created by Caio Soares on 18/08/22.
//

import SwiftUI

struct SignupView: View {
    
    @State private var username  = "" //lembrando que tem que ser um email para usar a api do adaspace
    @State private var email     = ""
    @State private var password  = ""
    
    @State private var emptyUsername = 0
    @State private var emptyMail     = 0
    @State private var emptyPassword = 0
    
    @State private var showingSignUpScreen = false
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                TextField("Username", text: $username)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(emptyUsername))
                TextField("Email", text: $email)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(emptyMail))
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(emptyPassword))
                Spacer()
                Button("Create Account") {
                    registerUser(username: username, email: email, password: password)
                }   .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                Spacer()
                Text("🛸")
                    .font(.largeTitle)
            }
        }
        .navigationBarTitle("Sign-up")
        .navigationBarHidden(false)
    }
    
    func registerUser(username: String, email: String, password: String) {
        if username.lowercased() != "" {
            emptyUsername = 0
            if email.lowercased() != "" {
                emptyMail = 0
                if password.lowercased() != "" {
                    emptyPassword = 0
                    showingSignUpScreen = true
                    
                    Task{
                        await API.createUser(name: username, email: email, password: password)
                    }
                    
                } else {
                    emptyPassword = 2
                }
            } else {
                emptyMail = 2
            }
        } else {
            emptyUsername = 2
        }
    }
    
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
