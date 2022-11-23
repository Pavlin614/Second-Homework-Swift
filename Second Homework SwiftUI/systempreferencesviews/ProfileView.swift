//
//  ProfileView.swift
//  Second Homework SwiftUI
//
//  Created by Pavlin Dimitrov on 23.11.22.
//

import SwiftUI

struct ProfileView: View {
    var profileIcon : String
    var buttonText: String
    var messageText: String
    
    var body: some View {
        HStack{
            Image(systemName: profileIcon)
                .font(.system(size: 60))
                .foregroundColor(.gray)
            VStack(alignment: .leading, spacing: 2) {
                Button(buttonText) {
                }
                Text(messageText)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profileIcon: "", buttonText: "", messageText: "")
    }
}
