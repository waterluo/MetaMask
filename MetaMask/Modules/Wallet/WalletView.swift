//
//  WalletView.swift
//  MetaMask
//
//  Created by sheng on 2022/7/29.
//

import SwiftUI

struct WalletView: View {
    @ObservedObject var model: UserData
    var body: some View {
//            ScrollView {
//                VStack {
//                    top
//                    bottom
//                }
//            }
        
    RefreshScrollView(refreshing: $model.loading) {
            VStack {
                top
                bottom
            }
        }
    }
    
    var top: some View {
        VStack {
            VStack {
                CircleImage(image: Image("avatar").resizable())
                    .frame(width: 50, height: 50)
                    .padding()
                Text(model.user.name)
                    .font(.title)
                Text("$\(model.user.balance)")
                    .font(.subheadline)
                Text("\(model.user.address)")
                    .font(.footnote)
                    .lineLimit(1)
                    .frame(width: 50, height: 30)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            btnsView
        }
    }
    
    var btnsView: some View {
        HStack(spacing: 10) {
            ForEach(WalletViewConstants.btns, id: \.self) { btn in
                Button {
                    
                } label: {
                    VStack(spacing: 10) {
                        Image(systemName: btn.image)
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                            .background(Color.primaryColor)
                            .clipShape(Circle())
                        Text(btn.title)
                            .font(.subheadline)
                            .foregroundColor(.primaryColor)
                    }
                }
            }
        }
    }

    
    var bottom: some View {
        PageContainer(items: ["TOKENS","NFTs"]) { item in
            if item == "TOKENS" {
                TokensView(tokens: model.user.tokens)
            } else if item == "NFTs" {
                NFTsView()
            }
        }.frame(height: 500)
    }
}

struct Btn: Hashable {
    var image: String
    var title: String
}

struct WalletViewConstants {
    static let btns: [Btn] = [
        Btn(image: "arrow.down.to.line.alt", title: "Receive"),
        Btn(image: "creditcard", title: "Buy"),
        Btn(image: "arrow.up.right", title: "Send"),
        Btn(image: "arrow.2.squarepath", title: "Swap")
    ]
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView(model: UserData())
    }
}
