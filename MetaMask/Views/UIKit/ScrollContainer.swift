//
//  ScrollContainer.swift
//  MetaMask
//
//  Created by sheng on 2022/7/28.
//

import SwiftUI

struct ScrollContainer<ItemView>: View where ItemView: View {
    var items: [String]
    var content: (String) -> ItemView
    init(items: [String], @ViewBuilder content: @escaping (String) -> ItemView) {
        self.items = items
        self.content = content
    }
    
    @State var contentOffset: CGPoint = .zero
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                let width = geo.size.width / CGFloat(items.count)
                HStack{
                    ForEach(items, id: \.self) { item in
                        Button {
                            
                        } label: {
                            Text(item)
                        }
                        .foregroundColor(showHighlight(item: item) ? Color.primaryColor : Color.gray)
                        .frame(width: width, height: Constants.buttonHight)
                    }
                }
                
                ZStack() {
                    Divider()
                    Color.primaryColor.frame(width: width, height: 2)
                        .offset(x: (contentOffset.x)/CGFloat(items.count - 1) * CGFloat(items.count) - width/2)
                }
                let pages = items.map { item in
                    content(item).frame(width: geo.size.width)
                }
                ScrollUI(contentOffset: $contentOffset, size: geo.size, pages: pages)
            }
        }
    }
    
    func showHighlight(item: String) -> Bool {
//        items[currentPage] == item
        true
    }
}

private struct Constants {
    static let buttonHight = 50.0
}

struct ScrollContainer_Previews: PreviewProvider {
    static var previews: some View {
        ScrollContainer(items: ["1", "2"]) { item in
            VStack {
                Text(item)
            }
        }
    }
}
