//
//  MetaMaskApp.swift
//  MetaMask
//
//  Created by sheng on 2022/7/28.
//

import SwiftUI

@main
struct MetaMaskApp: App {
    
    @StateObject var model = UserData()
    
    var body: some Scene {
        WindowGroup {
//                ContentView(model: model)
            if model.hideWelcome {
                ContentView(model: model)
            } else {
                WelcomeView(model: model)
            }
        }
    }
}
