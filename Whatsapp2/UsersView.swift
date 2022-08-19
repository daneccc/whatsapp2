//
//  UsersView.swift
//  Whatsapp2
//
//  Created by Caio Soares on 18/08/22.
//

import SwiftUI

struct UsersView: View {
    
    @State private var users = [User]()
    
    var body: some View {
        List(users, id: \.id) { user in
            VStack {
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.body)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
