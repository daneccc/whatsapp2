//
//  File.swift
//  Whatsapp2
//
//  Created by Caio Soares on 17/08/22.
//

import Foundation

struct Quote: Decodable {
    var quote_id: Int
    var quote: String
    var author: String
    var series: String
}
