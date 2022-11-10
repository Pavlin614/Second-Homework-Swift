//
//  JoinNow.swift
//  Second Homework SwiftUI
//
//  Created by Pavlin Dimitrov on 8.11.22.
//

import SwiftUI

struct JoinNow: View {
    @State private var username = ""
    @State private var name = ""
    @State private var phone = ""
    @State private var password = ""
    let link = "[Login](https://goolge.com)"
    
    var body: some View {
        VStack{
            Spacer()
            Group{
                TextFieldWithLabel(model: $username, label: "Username", messageToDisplay: "Enter your username", isPassword: false)
                
                TextFieldWithLabel(model: $name, label: "Name", messageToDisplay: "Enter your name", isPassword: false)
                
                TextFieldWithLabel(model: $phone, label: "Phone", messageToDisplay: "Enter your phone", isPassword: false)
                
                TextFieldWithLabel(model: $password, label: "Password", messageToDisplay: "Enter your password", isPassword: true).padding(.bottom, 50)
            }
            ButtonPlacedInTheBeginning(buttonText: "Register")
            Spacer()
            TextWithHyperlink(firstTextMessage: "I have an account!", link: link)
        }.padding()
    }
}

struct JoinNow_Previews: PreviewProvider {
    static var previews: some View {
        JoinNow()
    }
}

struct TextFieldWithLabel : View{
    @Binding var model: String
    let label: String
    let messageToDisplay: String
    let isPassword: Bool
    var body: some View{
        VStack{
            HStack{
                Text(label)
                Spacer()
            }
            if !isPassword {
                TextField("",text: $model, prompt: Text(messageToDisplay)).textFieldStyle(.roundedBorder).padding(.bottom,10)
            } else {
                SecureField("", text: $model, prompt: Text(messageToDisplay)).textFieldStyle(.roundedBorder).autocorrectionDisabled(true)
            }
        }
    }
}

struct ButtonPlacedInTheBeginning: View{
    let buttonText: String
    var body: some View{
        HStack{
            Button(buttonText){}.buttonStyle(.bordered).tint(.black)
            Spacer()
        }
    }
}

struct TextWithHyperlink: View{
    let firstTextMessage: String
    let link: String
    var body: some View{
        HStack{
            Text(firstTextMessage)
            Text(.init(link))
            Spacer()
        }
    }
}
