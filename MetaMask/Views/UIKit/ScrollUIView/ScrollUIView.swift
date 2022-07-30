//
//  ScrollUIView.swift
//  SwiftUIDemo
//
//  Created by sheng on 2022/7/28.
//

import SwiftUI

struct ScrollUIView<Page: View>: View {
    
    var pages: [Page]
    
    @State var contentOffset: CGPoint = .zero
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                ScrollUI(contentOffset: $contentOffset, size: proxy.size, pages: pages)
            }
        }
    }
}

struct ScrollUIView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollUIView(pages: [Color.red, Color.green, Color.blue])
    }
}
