//
//  CredentialModel.swift
//  Whatsapp2
//
//  Created by Caio Soares on 18/08/22.
//

import Foundation

struct Credential: Codable {
    var token: String
    var name: String = ""
    var email: String = ""
    var password: String = ""
    
}
