//
//  TokensView.swift
//  MetaMask
//
//  Created by sheng on 2022/7/29.
//

import SwiftUI

struct TokensView: View {
    var tokens: [Token]
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(tokens) { token in
                    NavigationLink {
                        TokenDetailView(token: token)
                    } label: {
                        TokensRow(token: token)
                    }
                }
            }
            
            VStack {
                Text("Don't see your token?")
                    .padding(.bottom, 5)
                NavigationLink {
                    ImportTokensView()
                } label: {
                    Text("Import Tokens")
                        .foregroundColor(.primaryColor)
                }
            }
            .frame(height: 100)
        }
    }
}

struct TokensView_Previews: PreviewProvider {
    static var previews: some View {
        TokensView(tokens: [Token.default])
    }
}
