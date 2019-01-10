//
//  MovieViewModel.swift
//  BRQiOSTest
//
//  Created by Gustavo Rodrigues on 10/01/19.
//  Copyright © 2019 Gustavo Soares Mascarenhas Rodrigues. All rights reserved.
//

import Foundation

struct MovieViewModel {
    
    let title: String
    let id: String
    var selecteId: String = ""
    
    init(movie: Movie) {
        self.title = movie.title!
        self.id = movie.id!
    }
}
