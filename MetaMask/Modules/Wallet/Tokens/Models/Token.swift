//
//  Token.swift
//  MetaMask
//
//  Created by sheng on 2022/7/29.
//

import Foundation

struct Token: Identifiable, Decodable {
    let id: Int
    var icon: String
    var amount: String
    var category: String
    var value: String
    static let `default` = Token(id: 1101, icon: "eth-logo", amount: "0.0002", category: "ETH", value: "0.34")
}
