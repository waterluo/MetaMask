//
//  ContentView.swift
//  MetaMask
//
//  Created by sheng on 2022/7/28.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @ObservedObject var model: UserData
    
    @State private var showScan = false
    @State private var current: Double = 1
    @State private var showMore = false
    @State private var showNetworks = false
    @State private var scannedCode: String?
    @State private var showAlert = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                NavigationView {
                    ZStack {
                        WalletView(model: model)
                            .zIndex(current)
                            .navigationBarTitleDisplayMode(.inline)
                    }
                    .fullScreenCover(isPresented: $showScan, content: {
                        ScanView(showScan: $showScan, scannedCode: $scannedCode, showAlert: $showAlert)
                    })
                    .alert(isPresented: $showAlert) {
                        if let result = scannedCode {
                           return Alert(
                                title: Text("Scanned Result"),
                                message: Text(result),
                                dismissButton: .default(Text("Ok")) {
                                    showAlert = false
                                    scannedCode = nil
                                }
                            )
                        } else {
                       return Alert(
                            title: Text("Camera access"),
                            message: Text("This app uses the camera to scan QR code. Please go to Settings and allow camera access to proceed."),
                            primaryButton: .default(Text("Settings")) {
                                if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
                                    UIApplication.shared.open(settingsUrl)
                                }
                            },
                            secondaryButton: .cancel()
                        )
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                withAnimation(.easeInOut(duration: Animation.duration)) {
                                    showMore = true
                                }
                            } label: {
                                Image(systemName: "ellipsis")
                            }
                        }
                        ToolbarItem(placement:.principal) {
                            Button {
                                withAnimation(.easeInOut(duration: Animation.duration)) {
                                    showNetworks = true
                                }
                            } label: {
                                VStack(spacing: 5) {
                                    Text("Wallet")
                                        .font(.footnote)
                                        .foregroundColor(.black)
                                    HStack {
                                        Color.green
                                            .frame(width: 5, height: 5)
                                            .clipShape(Circle())
                                        Text("Ethereum Main Network")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                checkCameraPermission()
                            } label: {
                                Image(systemName: "camera.viewfinder")
                            }
                        }
                    }
                }
                MoreView(show: $showMore, user: model.user)
                    .offset(x: showMore ? 0 : -geo.size.width)
                NetworksView(current: Network.default, show: $showNetworks)
                    .offset(y: showNetworks ? 0 : geo.size.height + geo.safeAreaInsets.bottom)
            }
        }
    }
    
    func checkCameraPermission() {
        if Camera.isAvailable {
            if AVCaptureDevice.authorizationStatus(for: .video) == .authorized {
                //already authorized
                print("already authorized")
                showScan = true
            } else {
                AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
                    if granted {
                        //access allowed
                        showScan = true
                        print("access allowed")
                    } else {
                        //access denied
                        print("access denied")
                        showAlert = true
                    }}
                )
            }
        } else {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: UserData())
    }
}
