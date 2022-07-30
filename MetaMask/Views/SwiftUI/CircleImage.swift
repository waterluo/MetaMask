//
//  CircleImage.swift
//  MetaMask
//
//  Created by sheng on 2022/7/28.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle()) // shape
            .overlay(Circle().stroke(.blue, lineWidth: 4)) // border
//            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("avatar").resizable())
            .scaledToFit()
            .frame(width: 100, height: 100)
    }
}
