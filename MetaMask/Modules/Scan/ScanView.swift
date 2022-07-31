//
//  ScanView.swift
//  MetaMask
//
//  Created by sheng on 2022/7/28.
//

import SwiftUI
import AVFoundation
import CodeScanner


struct ScanView: View {
    
    @Binding var showScan: Bool
    @Binding var scannedCode: String?
    @Binding var showAlert: Bool

    var body: some View {
        NavigationView {
            CodeScannerView(codeTypes: [.qr]) { response in
                if case let .success(result) = response {
                    scannedCode = result.string
                    showScan = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                        showAlert = true
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showScan = false
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("QR Code Scanning")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView(showScan: .constant(true), scannedCode: .constant("hello"), showAlert: .constant(true))
    }
}
