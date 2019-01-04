//
//  API.swift
//  BRQiOSTest
//
//  Created by Gustavo Soares Mascarenhas Rodrigues on 04/01/2019.
//  Copyright © 2019 Gustavo Soares Mascarenhas Rodrigues. All rights reserved.
//

import Foundation

class API {
    
    private static let basePath = "http://www.omdbapi.com/?i=tt3896198&apikey=c5c1e2c3&"
    
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = false
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        return config
    }()
    
    private static let session = URLSession(configuration: configuration)
    
    class func loadMovies() {
        guard let url = URL(string: basePath) else {return}
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {return}
                if response.statusCode == 200 {
                    do{
                        let movies = try JSONDecoder().decode([Movie].self, from: data!)
                        print(movies[0].title)
                    } catch {
                        print(error.localizedDescription)
                    }
                } else {
                    print("Status inválido pelo servidor")
                }
            } else {
                print(error!)
            }
        }
        dataTask.resume()
    }
}
