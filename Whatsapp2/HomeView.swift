//
//  HomeView.swift
//  Whatsapp2
//
//  Created by Caio Soares on 18/08/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var selection = 1
    
    var body: some View {
        TabView{
            PostView()
                .tabItem {
                    Label("Posts", systemImage: "pencil.circle.fill")
                }.tag(1)
            UsersView()
                .tabItem {
                    Label("Users", systemImage: "person.3.sequence.fill")
                }.tag(2)
        }   .navigationBarHidden(false)
            .navigationTitle(selection == 1 ? "Posts" : "Users")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
