//
//  DetailView.swift
//  ImageNamer
//
//  Created by Dmitry Reshetnik on 24.03.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var title: String
    var image: Image
    
    var body: some View {
        GeometryReader { geometry in
            self.image
                .resizable()
                .scaledToFit()
                .frame(maxWidth: geometry.size.width)
        }
        .navigationBarTitle(title)
    }
}
