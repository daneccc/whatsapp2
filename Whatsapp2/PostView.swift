//
//  ContentView.swift
//  Whatsapp2
//
//  Created by Caio Soares on 17/08/22.
//

import SwiftUI

struct PostView: View {
    
    @State private var posts = [Post]()
    @State private var quotes = [Quote]()
    
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
                await posts = fetchPosts()
            }
            
            
        }
    }
    
    func fetchPosts() async -> [Post] {
        //guard let url = URL(string: "https://www.breakingbadapi.com/api/quotes")
        
        let posts = URL(string: "http://adaspace.local/posts")!
        
        do {
            let (data, _) = try await URLSession.shared.data(from: posts)
            let decodedResponse = try JSONDecoder().decode([Post].self, from: data)
            print("Fetched data with success")
            return decodedResponse
        } catch {
            print("Error during the fetching of the data :c")
        }
        return []
        
    }
        
}
    

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
