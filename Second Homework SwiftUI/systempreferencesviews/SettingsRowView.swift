//
//  SettingsRowView.swift
//  Second Homework SwiftUI
//
//  Created by Pavlin Dimitrov on 23.11.22.
//

import SwiftUI

struct SettingsRowView : View {
    var title : String
    var systemImageName : String
    var color: Color
    var backgroundColor: Color
    var id: UUID
    
    var body : some View {
        HStack (spacing : 15) {
            Image(systemName: systemImageName)
                .frame(width: 25, height: 25)
                .foregroundColor(color)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            Text (title)
        }
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(title: "", systemImageName: "", color: Color.blue, backgroundColor: Color.blue, id: UUID())
    }
}
