//
//  TokenDetailView.swift
//  MetaMask
//
//  Created by sheng on 2022/7/29.
//

import SwiftUI

struct TokenDetailView: View {
    
    var token: Token
    
    var body: some View {
        ScrollView {
            LazyVStack {
                top
                middle
                bottom
            }
        }
        .toolbar {
            ToolbarItem(placement:.principal) {
                VStack(spacing: 5) {
                    Text("Wallet")
                        .font(.footnote)
                    HStack {
                        Color.green
                            .frame(width: 5, height: 5)
                            .clipShape(Circle())
                        Text("Ethereum Main Network")
                            .font(.caption)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var top: some View {
        VStack {
            Image("eth-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("\(token.amount) \(token.category)")
            Text("$\(token.value)")
                .font(.caption)
            btnsView
        }
    }
    
    var middle: some View {
        Button {
            
        } label: {
            VStack {
                HStack {
                    Text("Account added to this device")
                        .foregroundColor(.black)
                    Image(systemName: "exclamationmark.circle.fill")
                        .frame(width: 10, height: 10)
                        .foregroundColor(.black)
                }
                Text("Jul 28 at 5:23 pm")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
    

    
    var activities = [
        Activity.default,
    ]
    
    var bottom: some View {
        ForEach(activities) { activity  in
            ActivityView(activity: activity)
        }
    }
    
    var btnsView: some View {
        HStack(spacing: 10) {
            ForEach(WalletViewConstants.btns, id: \.self) { btn in
                Button {
                    
                } label: {
                    VStack(spacing: 10) {
                        Image(systemName: btn.image)
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
}

struct TokenDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TokenDetailView(token: Token.default)
    }
}
