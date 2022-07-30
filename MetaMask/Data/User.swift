//
//  User.swift
//  MetaMask
//
//  Created by sheng on 2022/7/28.
//

import Foundation

struct User: Decodable {
    var avatar: String
    var name: String
    var balance: String
    var address: String
    var tokens: [Token]
    var nfts: [NFT]
    static let `default` = User(avatar: "avatar", name: "Account", balance: "0.32", address: "0x", tokens: [Token.default], nfts: [])
}
