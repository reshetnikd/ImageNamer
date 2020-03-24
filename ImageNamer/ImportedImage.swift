//
//  ImportedImage.swift
//  ImageNamer
//
//  Created by Dmitry Reshetnik on 24.03.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import UIKit

struct ImportedImage: Comparable {
    var name: String
    var image: UIImage
    
    static func < (lhs: ImportedImage, rhs: ImportedImage) -> Bool {
        lhs.name < rhs.name
    }

}
