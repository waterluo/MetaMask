//
//  MoreRowView.swift
//  MetaMask
//
//  Created by sheng on 2022/7/29.
//

import SwiftUI

struct MoreRowView: View {
    var row: MoreRow
    var body: some View {
        HStack() {
            Image(systemName: row.icon)
                .frame(width: 30, height: 30)
            Text(row.title)
                .font(.subheadline)
            Spacer()
        }
    }
}

struct MoreRowView_Previews: PreviewProvider {
    static var previews: some View {
        MoreRowView(row: MoreRow.default)
    }
}
