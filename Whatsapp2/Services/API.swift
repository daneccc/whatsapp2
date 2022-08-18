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
        
        let fetchAllPostsLink = URL(string: "http://localhost:8080/posts")!
        //let fetchAllPostsLink = URL(string: "http://adaspace.local/posts")!
        
        do {
            let (data, _) = try await URLSession.shared.data(from: fetchAllPostsLink)
            let decodedResponse = try JSONDecoder().decode([Post].self, from: data)
            print("Fetched data with success")
            return decodedResponse
        } catch {
            print("Error during the fetching of the data :c")
        }
        return []
        
    }

    static func createUser(name: String, email: String, password: String) async -> Session? {
     
        let createUserLink = URL(string: "http://localhost:8080/users")!
        //let createUserLink = "http://adaspace.local/users"
        
        var request = URLRequest(url: createUserLink)
        
        let body: [String:Any] = [
            "name": name,
            "email": email,
            "password": password
        ]
        
        request.httpMethod = "POST"
        let jsonbody = try? JSONSerialization.data(withJSONObject: body)
        
        
        //perguntar para o otávio o que caralho é isso
        request.httpBody = jsonbody
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json"
        ]
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            let userData = try JSONDecoder().decode(Session.self, from: data)
            return userData
        } catch {
            print(ADASpaceError.invalidServerResponse)
        }
        return nil
        
    }
    
//    static func loginUser(username: String, password: String) async -> Session? {
//
//
//        let loginUserLink = "http://adaspace.local/users/login"
//
//        let login: String = "\(username):\(password)"
//        let loginData = login.data(using: String.Encoding.utf8)!
//        let base64 = logindata.base64EncodedString()
//
//        var request = URLRequest (url: URL(string: <#T##String#>))
//
//    }
    
}
