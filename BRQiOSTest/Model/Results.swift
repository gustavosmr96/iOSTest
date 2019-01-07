//
//  Results.swift
//  BRQiOSTest
//
//  Created by Gustavo Rodrigues on 06/01/19.
//  Copyright © 2019 Gustavo Soares Mascarenhas Rodrigues. All rights reserved.
//

import Foundation

class Results: Codable {
    var movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}
