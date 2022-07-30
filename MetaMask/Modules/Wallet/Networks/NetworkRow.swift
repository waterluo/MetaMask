//
//  NetworkRow.swift
//  MetaMask
//
//  Created by sheng on 2022/7/30.
//

import SwiftUI

struct NetworkRow: View {
    
    var network: Network
    
    var isSelected: Bool
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                if isSelected {
                    Image(systemName: "checkmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.black)
                } else {
                    Color.white.frame(width: 10, height: 10)
                }
                Image(network.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Text(network.title)
                    .font(.body)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(10)
        }
    }
}

struct NetworkRow_Previews: PreviewProvider {
    static var previews: some View {
        NetworkRow(network: Network.default, isSelected: true)
    }
}
