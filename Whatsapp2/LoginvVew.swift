//
//  Loginview.swift
//  Whatsapp2
//
//  Created by Caio Soares on 17/08/22.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username = "" //lembrando que tem que ser um email para usar a api do adaspace
    @State private var password = ""
    
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    
    @State private var showingLoginScreen = false
    
    @State private var navigationViewTitleIsShowing = false
    @State private var navigationViewCurrentTitle = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.ignoresSafeArea()
                Circle().scale(1.7).foregroundColor(.white.opacity(0.15))
                Circle().scale(1.35).foregroundColor(.white)
                VStack {
                    Text("ADASpace 🛸")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    Button("Login") {
                        autenthicateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: PostView(), isActive: $showingLoginScreen) {
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    func autenthicateUser(username: String, password: String) {
        if username.lowercased() == "caio" {
            wrongUsername = 0
            if password.lowercased() == "teste" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
