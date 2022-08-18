//
//  ContentView.swift
//  Whatsapp2
//
//  Created by Caio Soares on 17/08/22.
//

import SwiftUI

struct PostView: View {
    
    @State private var posts = [Post]()
    
    var body: some View {
        NavigationView {
            List(posts, id: \.id) { post in
                VStack {
                    VStack(alignment: .leading) {
                        Text(post.content)
                            .font(.body)
                            .foregroundColor(.black)
                        Text(post.created_at)
                            .font(.footnote)
                            .foregroundColor(.black)
                            .opacity(0.4)
                    }
                }
            }
            .navigationTitle("Posts")
            .task {
                await posts = API.fetchAllPosts()
            }
            
            
        }
    }
        
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
