//
//  Constants.swift
//  Network_Challege
//
//  Created by Caio Soares on 10/08/22.
//

import Foundation

enum ADASpaceError: Error {
    case invalidServerResponse
}

class API {
    
    static func getPosts(url: URL) async -> [Post] {
        
        //criação do request
        var urlRequest = URLRequest(url: url)
        
        //autentica
        //urlRequest.allHTTPHeaderFields = [:]
        
        do {
            
            //requisita os dados
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            
            //transforma o que será entregue em variável
            let decodedPost = try JSONDecoder().decode([Post].self, from: data)
            
            //debug
            print("fetched \(decodedPost.count) times")
            
            //retorna o post decodado
            return decodedPost
            
        } catch {
            print(ADASpaceError.invalidServerResponse)
        }
        return []
        
    }
    
}
