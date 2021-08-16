//
//  Using alert() and sheet() with optionals.swift
//  Project 19. SnowSeeker
//
//  Created by Prince$$ Di on 16.08.2021.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct Using_alert___and_sheet___with_optionals: View {
    @State private var selectedUser: User? = nil
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                    self.selectedUser = User()
                }
                .alert(item: $selectedUser) { user in
                    Alert(title: Text(user.id))
                }
    }
}

struct Using_alert___and_sheet___with_optionals_Previews: PreviewProvider {
    static var previews: some View {
        Using_alert___and_sheet___with_optionals()
    }
}
