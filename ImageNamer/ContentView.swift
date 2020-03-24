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
            .sheet(isPresented: $showingImagePicker, onDismiss: saveData) {
                ImagePicker(image: self.$inputImage)
            }
            .onAppear(perform: loadData)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadData() {
        let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
        
        do {
            let data = try Data(contentsOf: filename)
            images = try JSONDecoder().decode([ImportedImage].self, from: data)
        } catch {
            print("Unable to load saved data.")
            debugPrint(error)
        }
    }
    
    func saveData() {
        guard let inputImage = inputImage else { return }
        images.append(ImportedImage(name: UUID().uuidString, image: inputImage))
        do {
            let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
            let data = try JSONEncoder().encode(self.images)
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
