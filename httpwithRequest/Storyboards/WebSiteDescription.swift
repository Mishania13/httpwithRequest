//
//  WebSiteDescription.swift
//  httpwithRequest
//
//  Created by Mr. Bear on 09.04.2020.
//  Copyright © 2020 Mr. Bear. All rights reserved.
//

import Foundation

struct WebSiteDescription: Decodable {
    let websiteDescription: String?
    let websiteName: String?
    let courses: [Course?]
}
