//
//  ActivityView.swift
//  MetaMask
//
//  Created by sheng on 2022/7/29.
//

import SwiftUI

struct ActivityView: View {
    var activity: Activity
    var body: some View {
        VStack(alignment: .leading) {
            Text(activity.time)
                .font(.subheadline)
                .foregroundColor(.gray)
            HStack {
                HStack {
                    Image(systemName: activity.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.primaryColor)
                    
                    VStack(alignment: .leading) {
                        Text(activity.detail)
                            .font(.subheadline)
                        Text(activity.status)
                            .foregroundColor(.green)
                            .font(.caption)
                    }
                    .padding(.leading, 5)
                }
                Spacer()
                VStack(alignment:.trailing) {
                    Text("\(activity.amount) ETH")
                        .font(.subheadline)
                    Text("$\(activity.value)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(10)
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(activity: Activity.default)
    }
}
