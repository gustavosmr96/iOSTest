//
//  Movie.swift
//  BRQiOSTest
//
//  Created by Gustavo Soares Mascarenhas Rodrigues on 04/01/2019.
//  Copyright © 2019 Gustavo Soares Mascarenhas Rodrigues. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    var id: String?
    var title: String?
    var genre: String?
    var director: String?
    var released: String?
    var poster: String?
    var actors: String?
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title", genre = "Genre", director = "Director", released = "Released", poster = "Poster", actors = "Actors", id = "imdbID"
    }
}
