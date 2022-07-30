//
//  ScanView.swift
//  MetaMask
//
//  Created by sheng on 2022/7/28.
//

import SwiftUI

struct ScanView: View {
    
    @Binding var scan: Bool
    
    var body: some View {
        VStack {
            Button {
                scan = false
            } label: {
                Image(systemName: "xmark")
            }
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView(scan: .constant(true))
    }
}
