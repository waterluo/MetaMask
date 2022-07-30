//
//  ScrollUI.swift
//  SwiftUIDemo
//
//  Created by sheng on 2022/7/28.
//

import Foundation
import SwiftUI

struct ScrollUI<Page: View>: UIViewRepresentable {
    @Binding var contentOffset: CGPoint
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    var size: CGSize
    var pages: [Page]
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: size.width * CGFloat(pages.count), height: size.height)
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        for i in 0..<pages.count {
            let page = pages[i]
            let hostingVC = UIHostingController(rootView: page)
            if let view = hostingVC.view {
                scrollView.addSubview(view)
                view.frame = CGRect(origin: CGPoint(x: CGFloat(i) * size.width, y: 0), size: size)
            }
        }
        scrollView.delegate = context.coordinator
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        var scroll: ScrollUI
        init(_ scroll: ScrollUI) {
            self.scroll = scroll
        }
        
        // UIScrollViewDelegate
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            scroll.contentOffset = scrollView.contentOffset
            print(scrollView.contentOffset)
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            print("-----------------")
        }
    }
    
}
