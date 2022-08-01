//
//  TokensRow.swift
//  MetaMask
//
//  Created by sheng on 2022/7/29.
//

import SwiftUI

struct TokensRow: View {
    var token: Token
    var body: some View {
        VStack {
            HStack {
                Image(token.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                VStack(alignment: .leading) {
                    Text("\(token.amount) \(token.category)")
                        .foregroundColor(.black)
                    Text("$0.32")
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding(.trailing)
                    .foregroundColor(.gray)
            }
            Divider()
        }
        .frame(height: 60)
    }
}

struct TokensRow_Previews: PreviewProvider {
    static var previews: some View {
        TokensRow(token: Token.default)
    }
}
