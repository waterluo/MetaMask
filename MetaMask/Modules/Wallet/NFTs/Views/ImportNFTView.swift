//
//  ImportNFTView.swift
//  MetaMask
//
//  Created by sheng on 2022/7/29.
//

import SwiftUI

struct ImportNFTView: View {
    var body: some View {
        VStack {
            Text("ImportNFTView")
        }
        .toolbar {
            ToolbarItem(placement:.principal) {
                Button {
                    
                } label: {
                    VStack(spacing: 5) {
                        Text("Import tokens")
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
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ImportNFTView_Previews: PreviewProvider {
    static var previews: some View {
        ImportNFTView()
    }
}
