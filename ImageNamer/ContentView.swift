//
//  ContentView.swift
//  ImageNamer
//
//  Created by Dmitry Reshetnik on 24.03.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var images: [ImportedImage] = []
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    
    var body: some View {
        NavigationView {
            List(images, id: \.name) { imported in
                HStack {
                    Image(uiImage: imported.image)
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    Text(imported.name)
                }
            }
            .navigationBarTitle("Images")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingImagePicker = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $showingImagePicker, onDismiss: addImage) {
                ImagePicker(image: self.$inputImage)
            }
        }
    }
    
    func addImage() {
        guard let inputImage = inputImage else { return }
        
        images.append(ImportedImage(name: "test", image: inputImage))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
