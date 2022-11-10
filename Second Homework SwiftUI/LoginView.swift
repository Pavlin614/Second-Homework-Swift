//
//  ContentView.swift
//  Second Homework SwiftUI
//
//  Created by Pavlin Dimitrov on 6.11.22.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    let forgetPasswordLink = "[Forget Passoword](Forgot Password)"
    let link = "[Forgot password](https://goolge.com)"
    let joinNowLink = "[Join now](https://goolge.com)"
    
    var body: some View {
        VStack {
            Spacer()
            ImageWithTextBelow(imageName: "iOS-Apple", textMessage: "Log in to our iOS app")
            
            TextFieldWithoutLabel(model: $username, isPassword: false, promptMessage: "Enter you email")
            
            TextFieldWithoutLabel(model: $password, isPassword: false, promptMessage: "Enter your password")
                .padding(.bottom,10)
            
            ButtonPlacedInTheBeginning(buttonText: "Login").padding(.bottom,5)
            
            HStack{
                Text(.init(link))
                Spacer()
            }
            
            Spacer()
            
            TextWithHyperlink(firstTextMessage: "Don't have an account?", link: joinNowLink)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
