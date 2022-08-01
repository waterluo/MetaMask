//
//  NFTsView.swift
//  MetaMask
//
//  Created by sheng on 2022/7/29.
//

import SwiftUI

struct NFTsView: View {
    var body: some View {
        VStack(spacing: 0) {
            Color.white.frame(height: 20)
            HStack {
                VStack(alignment: .leading) {
                    Text("NFT detection")
                    Text("Allow MetaMask to automatically detect NFT's from OpenSea and display in your MetaMask wallet.")
                        .font(.caption)
                    Button("Turn on NFT detection in Setting") {
                        
                    }
                }
                VStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .foregroundColor(.gray)
                    .frame(width: 50, height: 50)
                    Spacer()
                }
            }
            .padding(5)
            .frame(height: 90)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.primaryColor))
            
            VStack {
                Color.white.frame(height: 80)
                Text("No NFTs yet")
                    .font(.bold(.title)())
                Button("Learn more") {
                    
                }
                .foregroundColor(.primaryColor)
            }
            
            Color.white.frame(height: 50)
            VStack {
                Text("Don't see your NFT?")
                NavigationLink {
                    ImportNFTView()
                } label: {
                    Text("Import NFTs")
                        .foregroundColor(.primaryColor)
                }
            }
            Spacer()
        }.padding(.top, 35)

    }
}

struct NFTsView_Previews: PreviewProvider {
    static var previews: some View {
        NFTsView()
    }
}
