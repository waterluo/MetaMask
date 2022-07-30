//
//  PageContainer.swift
//  MetaMask
//
//  Created by sheng on 2022/7/29.
//

import SwiftUI

struct PageContainer<ItemView>: View where ItemView: View  {
    var items: [String]
    var content: (String) -> ItemView
    init(items: [String], @ViewBuilder content: @escaping (String) -> ItemView) {
        self.items = items
        self.content = content
    }
    @State private var currentPage = 0
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                let width = geo.size.width / CGFloat(items.count)
                HStack{
                    ForEach(items, id: \.self) { item in
                        Button {
                            changePage(item: item)
                        } label: {
                            Text(item)
                        }
                        .foregroundColor(showHighlight(item: item) ? Color.primaryColor : Color.gray)
                        .frame(width: width, height: Constants.buttonHight)
                    }
                }
                let pages = items.map { item in
                    content(item)
                }
                PageViewController(pages: pages, currentPage: $currentPage)
            }
        }
    }
    
    func showHighlight(item: String) -> Bool {
        items[currentPage] == item
    }
    
    func changePage(item: String) {
        if items[currentPage] == item { return }
        currentPage = items.firstIndex(of: item)!
    }
}

private struct Constants {
    static let buttonHight = 50.0
}

struct PageContainer_Previews: PreviewProvider {
    static var previews: some View {
        PageContainer(items: ["1", "2"]) { item in
            VStack {
                Text(item)
            }
        }
    }
}
