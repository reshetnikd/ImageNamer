//
//  ImportedImage.swift
//  ImageNamer
//
//  Created by Dmitry Reshetnik on 24.03.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import UIKit
import CoreLocation

struct ImportedImage: Comparable, Codable {
    var name: String
    var image: UIImage
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
    
    static func < (lhs: ImportedImage, rhs: ImportedImage) -> Bool {
        lhs.name < rhs.name
    }
}

public protocol ImageCodable: Codable {}

extension UIImage: ImageCodable {}

extension ImageCodable where Self: UIImage {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.init(data: try container.decode(Data.self))!
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.jpegData(compressionQuality: 0.8)!)
    }
}
