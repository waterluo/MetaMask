//
//  Activity.swift
//  MetaMask
//
//  Created by sheng on 2022/7/29.
//

import Foundation

struct Activity: Identifiable {
    let id = UUID()
    var time: String
    var icon: String
    var detail: String
    var status: String
    var amount: String
    var value: String
    static let `default` = Activity(time: "Jan 20 at 12:17 pm", icon: "arrow.up.right.circle", detail: "Sent ETH", status: "Confirmed", amount: "0.504", value: "859.94")
}
