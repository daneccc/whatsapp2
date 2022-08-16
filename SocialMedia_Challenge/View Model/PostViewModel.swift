//
//  PostViewModel.swift
//  Network_Challege
//
//  Created by Caio Soares on 11/08/22.
//

import Foundation

class PostListViewModel {
    
    private(set) var posts: [PostViewModel] = []
    
    func populatePosts(url: URL) async {
        
        do {
            let posts = try await API.getPosts(url: url)
            self.posts = posts.map(PostViewModel.init)
        } catch {
            print(error)
        }
        
    }
    
}

struct PostViewModel {
    
    private let post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    var content: String {
        post.content
    }
    
}
