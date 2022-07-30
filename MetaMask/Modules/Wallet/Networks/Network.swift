//
//  Network.swift
//  MetaMask
//
//  Created by sheng on 2022/7/30.
//

import Foundation

struct Network: Identifiable {
    let id = UUID()
    var icon: String
    var title: String
    static let `default` = Network(icon: "eth-logo", title: "Ethereum Main Network")
}
