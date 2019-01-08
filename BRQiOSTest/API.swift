//
//  API.swift
//  BRQiOSTest
//
//  Created by Gustavo Soares Mascarenhas Rodrigues on 04/01/2019.
//  Copyright © 2019 Gustavo Soares Mascarenhas Rodrigues. All rights reserved.
//

import Foundation

enum MovieError {
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
}

class API {
    
    private static let basePath = "http://www.omdbapi.com/?apikey=c5c1e2c3&"
    private static let session = URLSession.shared
    
    class func loadMovies(search: String, onComplete: @escaping ([Movie]) -> Void, onError: @escaping (MovieError) -> Void) {
        guard let url = URL(string: basePath+"s="+search) else {
            onError(.url)
            return
        }
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                if response.statusCode == 200 {
                    do{
                        let movies = try JSONDecoder().decode(Results.self, from: data!)
                        onComplete(movies.movies)
                    } catch {
                        print(error.localizedDescription)
                        onError(.invalidJSON)
                    }
                } else {
                    print("Status inválido pelo servidor")
                    onError(.responseStatusCode(code: response.statusCode))
                }
            } else {
                onError(.taskError(error: error!))
            }
        }
        dataTask.resume()
    }
    
    class func loadMovie(id: String, onComplete: @escaping (Movie) -> Void, onError: @escaping (MovieError) -> Void) {
        guard let url = URL(string: basePath+"i="+id) else {
            onError(.url)
            return
        }
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                if response.statusCode == 200 {
                    do{
                        let movie = try JSONDecoder().decode(Movie.self, from: data!)
                        onComplete(movie)
                    } catch {
                        print(error.localizedDescription)
                        onError(.invalidJSON)
                    }
                } else {
                    print("Status inválido pelo servidor")
                    onError(.responseStatusCode(code: response.statusCode))
                }
            } else {
                onError(.taskError(error: error!))
            }
        }
        dataTask.resume()
    }
}
