//
//  DetailViewModel.swift
//  BRQiOSTest
//
//  Created by Gustavo Soares Mascarenhas Rodrigues on 08/01/2019.
//  Copyright © 2019 Gustavo Soares Mascarenhas Rodrigues. All rights reserved.
//

import Foundation

class DetailViewModel {
    private let api  = API()
    
    private var movie: Movie? {
        didSet {
            self.setViewItems?()
        }
    }
    
    var setViewItems: (()->())?
    
    func fetchMovie(id: String){
        API.loadMovie(id: id, onComplete: { (movie) in
            self.movie = movie
        }) { (error) in
            print(error)
        }
    }
    
    func movieDetails() -> Movie? {
        guard let movie =  self.movie else {return nil}
        return movie
    }
    
}
