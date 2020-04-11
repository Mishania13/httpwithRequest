//
//  ImageProperties.swift
//  httpwithRequest
//
//  Created by Mr. Bear on 11.04.2020.
//  Copyright © 2020 Mr. Bear. All rights reserved.
//

import UIKit

struct ImageProperties {
    
    let key: String
    let data: Data
    
    init?(withImage image: UIImage, forKey key: String) {
        self.key = key
        guard let data = image.pngData() else {return nil}
        self.data = data
    }
}
