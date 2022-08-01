//
//  TabScrollView.swift
//  MetaMask
//
//  Created by sheng on 2022/8/1.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct TabScrollView<ItemView>: View where ItemView: View  {
    var items: [TabItem]
    var content: (TabItem) -> ItemView
    init(items: [TabItem], @ViewBuilder content: @escaping (TabItem) -> ItemView) {
        self.items = items
        self.content = content
    }
    
    @State private var selectedIndex = 0
    @Namespace var ns
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(0..<items.count, id: \.self) { i in
                content(items[i])
                    .tag(i)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .overlay(
            overlayView
            , alignment: .top
        )
        .padding(.top)
    }
    
    var overlayView: some View {
        VStack(spacing: 1) {
                HStack {
                    ForEach(0..<items.count, id: \.self) { i in
                        VStack {
                            Text(items[i].title)
                                .foregroundColor(selectedIndex == i ? .primaryColor : .gray)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                            if selectedIndex == i {
                                Rectangle()
                                    .fill(Color.primaryColor)
                                    .frame(height: 2)
                                    .matchedGeometryEffect(id: "tab", in: ns)
                            } else {
                                Rectangle()
                                    .fill(Color.clear)
                                    .frame(height: 2)
                            }
                        }
                        .onTapGesture {
                            withAnimation {
                                selectedIndex = i
                            }
                        }
                    }
                }
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 1.5)
                    .offset(y: -1.5)
            
           
        }.background(Color.white)
    }
}

struct TabScrollView_Previews: PreviewProvider {
    static var previews: some View {
        TabScrollView(items: [TabItem(title: "TOKENS"), TabItem(title: "NFTS")]) { item in
            VStack {
                Text(item.title)
            }
        }
    }
}
