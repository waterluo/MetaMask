//
//  MoreRow.swift
//  MetaMask
//
//  Created by sheng on 2022/7/29.
//

import Foundation

struct MoreRow: Hashable {
    var icon: String
    var title: String
    
    static let `default` = MoreRow(icon: "network", title: "Browser")
}
