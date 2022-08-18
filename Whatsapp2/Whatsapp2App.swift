//
//  Whatsapp2App.swift
//  Whatsapp2
//
//  Created by Caio Soares on 17/08/22.
//

import SwiftUI

@main
struct Whatsapp2App: App {
    
//    @StateObject var authentication = Authentication()
    
    var body: some Scene {
        WindowGroup {
//            if authentication.isValidated {
//                PostView()
//                    .environmentObject(authentication)
//            } else {
//                LoginView()
//            }
            LoginView()
        }
    }
}
