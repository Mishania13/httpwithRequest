//
//  GitsProfiles.swift
//  httpwithRequest
//
//  Created by Mr. Bear on 09.04.2020.
//  Copyright © 2020 Mr. Bear. All rights reserved.
//

import Foundation

struct GitProfileInfo: Decodable {
    let login: String?
    let id: Int?
    let url: String?
    let avatar_url: String?
    let location: String?
    let public_repos: Int?
    let bio: String?
    let email: String?
}
