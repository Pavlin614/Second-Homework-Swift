//
//  SettingsRowWithoutSystemIcon.swift
//  Second Homework SwiftUI
//
//  Created by Pavlin Dimitrov on 23.11.22.
//

import SwiftUI

struct SettingsRowWithoutSystemIcon: View {
    var title: String
    var image: String
    var id: UUID
    
    var body : some View {
        HStack (spacing: 15) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            Text (title)
        }
    }
}

struct SettingsRowWithoutSystemIcon_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowWithoutSystemIcon(title: "", image: "", id: UUID())
    }
}
