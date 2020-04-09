//
//  Course.swift
//  httpwithRequest
//
//  Created by Mr. Bear on 09.04.2020.
//  Copyright © 2020 Mr. Bear. All rights reserved.
//

import Foundation

struct  Course: Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    let number_of_lessons: Int?
    let number_of_tests: Int?
}
