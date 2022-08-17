//
//  PostModel.swift
//  Whatsapp2
//
//  Created by Caio Soares on 17/08/22.
//

import Foundation

//struct Post: Codable {
//    var id: Int
//    var content: String
//}

struct Post: Decodable {
    var like_count: Int
    var content: String
    var media: String? = nil
    var updated_at: String
    var created_at: String
    var user_id: String
    var id: String
}

//"like_count": 0,
//"media": "media/934b5fc4de884f8141fd1d5dc4299a.png",
//"content": "Aprendi a criar um post com imagem 🌆! 😱",
//"updated_at": "2022-08-11T13:19:14Z",
//"created_at": "2022-08-11T13:19:14Z",
//"user_id": "05082CDE-C36A-4795-9F6D-45C74B8DD2CD",
//"id": "E3ACBE69-CA7D-43B8-9E15-C1706CED2BDB"
