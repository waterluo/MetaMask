//
//  WelcomeView.swift
//  MetaMask
//
//  Created by sheng on 2022/7/30.
//

import SwiftUI

struct Welcome: Hashable {
    var title: String
    var detail: String
    var image: String
    static let `default` = Welcome(title: "Welcome to MetaMask", detail: "Trusted by millions, MetaMask is a secure wallet making the world of web3 accessible to all.", image: "onboarding-carousel-1")
}

struct WelcomeView: View {
    var wels: [Welcome] = WelcomeViewConstants.wels
    
    @ObservedObject var model: UserData
    
    var body: some View {
        VStack(spacing: 20) {
            Image("metamask-name")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 50)
            TabView {
                ForEach(wels, id: \.self) { wel in
                    WelcomeContentView(welcome: wel)
                }
            }
            .tabViewStyle(.page)
            Button {
                model.hideWelcomePage()
            } label: {
                Text("Get started")
                    .foregroundColor(.primaryColor)
            }
            .frame(width: 300, height: 40)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.primaryColor))
            Spacer(minLength: 10)
        }
    }
    
}

struct WelcomeContentView: View {
    var welcome: Welcome
    var body: some View {
        VStack(spacing: 70){
            VStack(spacing: 20) {
                Text(welcome.title)
                    .font(.bold(.title)())
                HStack {
                    Spacer(minLength: 40)
                    Text(welcome.detail)
                        .font(.caption)
                    Spacer(minLength: 40)
                }
            }
            Image(welcome.image)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
        }
    }
}


struct WelcomeViewConstants {
    static let wels = [
        Welcome.default,
        Welcome(title: "Manage your digit assets", detail: "Store, spend and send digital assets like tokens, ethereum, unique collectibles.", image: "onboarding-carousel-2"),
        Welcome(title: "Your gateway to web3", detail: "Login with MetaMask and make transactions to invest, earn, play games, sell and more!", image: "onboarding-carousel-3")
        
    ]
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(model: UserData())
    }
}
