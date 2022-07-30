//
//  PageView.swift
//  Landmarks
//
//  Created by sheng on 2022/5/18.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    var pages: [Page]
    
    @State private var currentPage = 0
        
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
        PageViewController(pages: pages, currentPage: $currentPage)
        PageControl(numberOfPages: pages.count, currentPagge: $currentPage)
            .frame(width: CGFloat(pages.count * 18))
            .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: [Color.red, Color.green, Color.blue]
        )
        .aspectRatio(3/2, contentMode: .fit)
    }
}
