//
//  MoreView.swift
//  MetaMask
//
//  Created by sheng on 2022/7/29.
//

import SwiftUI

struct MoreView: View {
    @Binding var show: Bool
    var user: User
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                leftView.background(Color.white)
                    .frame(width: geo.size.width * (2/3))
                Color.black
                    .opacity(0.5)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: Animation.duration)) {
                            show = false
                        }
                    }
                    .ignoresSafeArea()
            }
        }
    }
    
    var leftTop: some View {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Image("fox")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                    Text("METAMASK")
                        .font(.title)
                        .padding(.leading)
                }
                CircleImage(image: Image("avatar").resizable())
                    .frame(width: 70, height: 70)
                    .padding([.top, .bottom])
                    HStack {
                        Text(user.name)
                            .font(.title)
                        Image(systemName: "arrowtriangle.down.fill")
                    }
                Text("$\(user.balance)")
                Text("\(user.address)")
                    .frame(width: 100)
                    .lineLimit(1)
            }
            .padding([.leading, .bottom])

    }
    
    var leftMiddle: some View {
        GeometryReader { geo in
            let width = (geo.size.width - 10.0 * 3.0)/2.0
            let height = 40.0
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        Label("Send", systemImage: "arrow.up.right")
                            .font(.subheadline)
                            .foregroundColor(.primaryColor)
                    }
                    .frame(width: width, height: height)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.primaryColor))
                    Spacer()
                    Button {
                        
                    } label: {
                        Label("Add funds", systemImage: "arrow.up.right")
                            .font(.subheadline)
                            .foregroundColor(.primaryColor)
                    }
                    .frame(width: width, height: height)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.primaryColor))
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    var groups = [
        [MoreRow.default, MoreRow(icon: "wallet.pass", title: "Wallet"), MoreRow(icon: "list.bullet", title: "Activity")],
        [MoreRow(icon: "square.and.arrow.up", title: "Share my Public Address"), MoreRow(icon: "eye", title: "View on Etherscan")],
        [MoreRow(icon: "gearshape", title: "Settings"), MoreRow(icon: "bubble.left.and.bubble.right", title: "Support"), MoreRow(icon: "bubble.left", title: "Request a Ftature"), MoreRow(icon: "lock", title: "Lock")]
    ]
    
    var leftBottom: some View {
        ForEach(groups, id: \.self) { group in
            Divider()
            ForEach(group, id: \.self) { row in
                Button {
                    withAnimation(.easeInOut(duration: Animation.duration)) {
                        show = false
                    }
                } label: {
                    MoreRowView(row: row)
                        .padding()
                        .frame(height: 50)
                        .foregroundColor(.gray)
                }
            }
        }
    }
    
    
    var leftView: some View {
        GeometryReader { geo in
            ScrollView {
                Color.white.frame(height: geo.safeAreaInsets.top)
                LazyVStack(alignment: .leading, spacing: 0) {
                    leftTop
                    Divider()
                    leftMiddle
                        .frame(height: 60)
                    leftBottom
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView(show: .constant(true), user: User.default)
    }
}
