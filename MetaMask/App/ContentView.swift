//
//  ContentView.swift
//  MetaMask
//
//  Created by sheng on 2022/7/28.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model: UserData
    
    @State private var showScan = false
    @State private var current: Double = 1
    @State private var showMore = false
    @State private var showNetworks = false

    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                NavigationView {
                    ZStack {
                        WalletView(model: model)
                            .zIndex(current)
                            .navigationBarTitleDisplayMode(.inline)
                    }
                    .fullScreenCover(isPresented: $showScan, content: {
                        ScanView(scan: $showScan)
                    })
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                withAnimation(.easeInOut(duration: Animation.duration)) {
                                    showMore = true
                                }
                            } label: {
                                Image(systemName: "ellipsis")
                            }
                        }
                        ToolbarItem(placement:.principal) {
                            Button {
                                withAnimation(.easeInOut(duration: Animation.duration)) {
                                    showNetworks = true
                                }
                            } label: {
                                VStack(spacing: 5) {
                                    Text("Wallet")
                                        .font(.footnote)
                                        .foregroundColor(.black)
                                    HStack {
                                        Color.green
                                            .frame(width: 5, height: 5)
                                            .clipShape(Circle())
                                        Text("Ethereum Main Network")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                showScan = true
                            } label: {
                                Image(systemName: "camera.viewfinder")
                            }
                        }
                    }
                }
                MoreView(show: $showMore, user: model.user)
                    .offset(x: showMore ? 0 : -geo.size.width)
                NetworksView(current: Network.default, show: $showNetworks)
                    .offset(y: showNetworks ? 0 : geo.size.height + geo.safeAreaInsets.bottom)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: UserData())
    }
}
