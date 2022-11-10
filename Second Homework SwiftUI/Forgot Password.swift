//
//  Forgot Password.swift
//  Second Homework SwiftUI
//
//  Created by Pavlin Dimitrov on 8.11.22.
//

import SwiftUI

struct Forgot_Password: View {
    @State private var email = ""
    
    var body: some View {
        VStack{
            ImageWithTextBelow(imageName: "iOS-Apple", textMessage: "Please, enter your email!")
            TextFieldWithoutLabel(model: $email, isPassword: false, promptMessage: "Enter your email here")
                .padding(.bottom,5)
            
            Button {
                
            } label: {
                Text("Recover password")
                    .frame(maxWidth: .infinity)
            }.buttonStyle(.bordered)
            Spacer()
        }.padding()
    }
}

struct Forgot_Password_Previews: PreviewProvider {
    static var previews: some View {
        Forgot_Password()
    }
}

struct TextFieldWithoutLabel: View{
    @Binding var model: String
    let isPassword: Bool
    let promptMessage: String
    var body: some View{
        HStack{
            if !isPassword {
                TextField("", text: $model, prompt: Text(promptMessage)).textFieldStyle(.roundedBorder)
            } else {
                SecureField("", text: $model, prompt: Text(promptMessage)).textFieldStyle(.roundedBorder).autocorrectionDisabled(true)
            }
        }
    }
}


struct ImageWithTextBelow: View{
    let imageName: String
    let textMessage: String
    var body: some View{
        Image(imageName)
            .resizable()
            .scaledToFit()
            .padding(.vertical,20)
        Text(textMessage).font(.system(size: 20, weight: .medium, design: .serif))
    }
}
