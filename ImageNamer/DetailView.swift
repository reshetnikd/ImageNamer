//
//  DetailView.swift
//  ImageNamer
//
//  Created by Dmitry Reshetnik on 24.03.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import SwiftUI
import CoreLocation

struct DetailView: View {
    var imported: ImportedImage
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image(uiImage: self.imported.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: geometry.size.width)
                
                MapView(centerCoordinate: CLLocationCoordinate2D(latitude: self.imported.latitude, longitude: self.imported.longitude))
            }
        }
        .navigationBarTitle(imported.name)
    }
}
