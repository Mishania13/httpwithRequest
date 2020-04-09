//
//  GitProfilesList.swift
//  httpwithRequest
//
//  Created by Mr. Bear on 09.04.2020.
//  Copyright © 2020 Mr. Bear. All rights reserved.
//

import Foundation

struct GitProfilesList: Decodable {
    let login: String
    let id: Int
    let avatarUrl: String
    let url: String
    let htmlUrl: String
    let gistsUrl: String
    let type: String
    let siteAdmin: Bool
}
