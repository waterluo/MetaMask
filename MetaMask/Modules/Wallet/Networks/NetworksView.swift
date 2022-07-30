//
//  NetworksView.swift
//  MetaMask
//
//  Created by sheng on 2022/7/30.
//

import SwiftUI

struct NetworksView: View {
    
    @State var current: Network
    
    @Binding var show: Bool
    
    var body: some View {
        GeometryReader { geo in
        ZStack {
            Color.black
                .opacity(0.5)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: Animation.duration)) {
                        show = false
                    }
                }
            VStack {
                ZStack {
                    Text("Networks")
                        .font(.title)
                    Button {
                        withAnimation(.easeInOut(duration: Animation.duration)) {
                            show = false
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.gray)
                    }
                    .offset(x: 150)
                }
                ScrollView {
                    LazyVStack {
                        ForEach(Constants.networks) { network in
                            Button {
                                current = network
                            } label: {
                                NetworkRow(network: network, isSelected: isSelected(network: network))
                            }
                        }
                    }
                }
                
                Button("Add a network") {
                    withAnimation(.easeInOut(duration: Animation.duration)) {
                        show = false
                    }                }
                .frame(width: 300, height: 40)
                .background(Color.primaryColor)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .foregroundColor(.white)
            }
            .padding()
            .frame(width: 350, height: 400)
            .background(Color.white)
        }
        }
        .ignoresSafeArea()
}
    
    func isSelected(network: Network) -> Bool {
        current.title == network.title
    }
    

    
    struct Constants {
        static let networks = [
            Network.default,
            Network(icon: "eth-logo", title: "Ropsten Test Network"),
            Network(icon: "eth-logo", title: "Kovan Test Network"),
            Network(icon: "eth-logo", title: "Rinkeby Test Network"),
            Network(icon: "eth-logo", title: "Goerli Test Network"),
        ]
    }
}

struct NetworksView_Previews: PreviewProvider {
    static var previews: some View {
        NetworksView(current: .default, show: .constant(true))
    }
}
