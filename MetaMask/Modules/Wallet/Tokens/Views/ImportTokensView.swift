//
//  ImportTokensView.swift
//  MetaMask
//
//  Created by sheng on 2022/7/29.
//

import SwiftUI

struct ImportTokensView: View {
    var body: some View {
        VStack {
            Text("Import Tokens Detail")
        }
        .toolbar {
            ToolbarItem(placement:.principal) {
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
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ImportTokensView_Previews: PreviewProvider {
    static var previews: some View {
        ImportTokensView()
    }
}
