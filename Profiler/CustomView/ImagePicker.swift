//
//  ImagePicker.swift
//  Profiler
//
//  Created by mac on 13/02/22.
//

import SwiftUI;

// class for communication swiftui and image picker
final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var imagePicker: ImagePicker;
   
    
    init(_ imagePicker: ImagePicker) {
        self.imagePicker = imagePicker;
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
        if let imageSource = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imagePicker.image = imageSource
        }
        imagePicker.presentationMode.wrappedValue.dismiss()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.presentationMode.wrappedValue.dismiss()
    }
}


// image picker
struct ImagePicker: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Environment(\.presentationMode) var presentationMode;
    @Binding var image: UIImage;

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) ->  UIImagePickerController {
        let picker = UIImagePickerController();
        picker.allowsEditing = false;
        picker.sourceType = sourceType
        picker.delegate = context.coordinator;
        return picker;
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}
