//
//  User.swift
//  Whatsapp2
//
//  Created by Caio Soares on 18/08/22.
//

import Foundation

struct User: Codable {
    var id: UUID
    var name: String
    var email: String
    var avatar: String?
}
