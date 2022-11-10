//
//  HomeView.swift
//  Second Homework SwiftUI
//
//  Created by Pavlin Dimitrov on 8.11.22.
//

import SwiftUI

struct HomeView: View {
    let images = ["iOS-Apple", "anti_android"]
    let imageDescriptions = ["first", "second"]
    var body: some View {
        VStack{
            ImagesWithSwipe(images: images, imageDescriptions: imageDescriptions)
            Spacer()
            LoginAndJoinButtons()
            Text("Continue as Guest").padding(.top,20)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct LoginAndJoinButtons: View {
    var body: some View {
        HStack{
            Button{}label:{Text("Login").frame(width: 100)} .buttonStyle(.bordered).tint(.black).padding(.trailing,10)
            Button{}label:{Text("Join Now").frame(width: 100)}.buttonStyle(.bordered).tint(.black)
        }
    }
}

struct ImagesWithSwipe: View {
    let images : [String]
    let imageDescriptions : [String]
    var body: some View {
        TabView {
            ForEach(0..<images.count) { i in
                ZStack{
                    Color.black
                    VStack {
                        Image(images[i])
                            .resizable()
                            .scaledToFit()
                        Text("\(imageDescriptions[i])")
                            .foregroundColor(.white).padding(.bottom,20)
                    }
                }.clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            }
            .padding(.all, 10)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
        .tabViewStyle(PageTabViewStyle())
    }
}
