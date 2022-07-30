//
//  PageControl.swift
//  Landmarks
//
//  Created by sheng on 2022/5/18.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    var numberOfPages: Int
    
    @Binding var currentPagge: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPagge
    }
    
    class Coordinator: NSObject {
        var control: PageControl
        init(_ control: PageControl) {
            self.control = control
        }
        
        
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPagge = sender.currentPage
        }
        
    }
    
    
    
    
}
