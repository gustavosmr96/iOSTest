//
//  MoviesViewModel.swift
//  BRQiOSTest
//
//  Created by Gustavo Soares Mascarenhas Rodrigues on 07/01/2019.
//  Copyright © 2019 Gustavo Soares Mascarenhas Rodrigues. All rights reserved.
//

import Foundation

//public typealias UpdatedClosure = () -> ()

class MoviesViewModel: NSObject {

    private let service = API()
    
    var movies: [Movie] = []
    var selectedMovieId: String = ""
    
    private var data: [MoviesCellViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.reloadTableViewClosure?()
            }
        }
    }
    var reloadTableViewClosure: (()->())?
    
    func fetchMovies(title: String){
        API.loadMovies(search: title, onComplete: { (movies) in
            let movies = movies
            self.data = self.movieViewModels(movies: movies)
        }) { (error) in
            print(error)
        }
    }
    
    func movieViewModels(movies: [Movie]) -> [MoviesCellViewModel] {
        var moviesViewModels: [MoviesCellViewModel] = []
        for movie in movies {
            let movieCell = MoviesCellViewModel(movie.title!, movie.id!)
            moviesViewModels.append(movieCell)
        }
        return moviesViewModels
    }
    public func numberOfRows() -> Int {
        return self.data.count
    }
    
    public func cellVM(forIndex index: Int) -> MoviesCellViewModel {
        return self.data[index]
    }
    
    public func movieID(indexPath: IndexPath){
        self.selectedMovieId = self.data[indexPath.row].idValue()
    }
}
