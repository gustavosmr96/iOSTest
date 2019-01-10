//
//  DetailViewModel.swift
//  BRQiOSTest
//
//  Created by Gustavo Soares Mascarenhas Rodrigues on 08/01/2019.
//  Copyright © 2019 Gustavo Soares Mascarenhas Rodrigues. All rights reserved.
//

import Foundation

class DetailViewModel {
    
    let title: String
    let released: String
    let genre: String
    let director: String
    let actors: String
    let poster: String
    
    init(movie: Movie) {
        self.title = movie.title!
        self.released = movie.released!
        self.genre = movie.genre!
        self.director = movie.director!
        self.actors = movie.actors!
        self.poster = movie.poster!
    }
    
//    private let api  = API()
//    
//    private var movie: Movie? {
//        didSet {
//            self.setViewItems?()
//        }
//    }
//    
//    var setViewItems: (()->())?
//    
//    func fetchMovie(id: String){
//        API.loadMovie(id: id, onComplete: { (movie) in
//            self.movie = movie
//        }) { (error) in
//            print(error)
//        }
//    }
//    
//    func movieDetails() -> Movie? {
//        guard let movie =  self.movie else {return nil}
//        return movie
//    }
    
}
