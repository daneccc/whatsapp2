//
//  API.swift
//  Whatsapp2
//
//  Created by Caio Soares on 18/08/22.
//

import Foundation

enum ADASpaceError: Error {
    case invalidServerResponse
}

class API {
    
    static func fetchAllPosts() async -> [Post] {
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
