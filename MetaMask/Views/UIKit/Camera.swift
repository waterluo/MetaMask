//
//  Camera.swift
//  MetaMask
//
//  Created by Tiyo on 2022/7/30.
//

import Foundation

import SwiftUI

struct Camera: UIViewControllerRepresentable {
    
   var handlePickerImage: (UIImage?) -> Void
    
   static var isAvailable: Bool {
        UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(handlePickerImage: handlePickerImage)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        //
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var handlePickerImage: (UIImage?) -> Void

        init(handlePickerImage: @escaping (UIImage?) -> Void) {
            self.handlePickerImage = handlePickerImage
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            handlePickerImage(nil)
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            handlePickerImage((info[.editedImage] ?? info[.originalImage]) as? UIImage)
        }
    }

}
