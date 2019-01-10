//
//  BRQiOSTestTests.swift
//  BRQiOSTestTests
//
//  Created by Gustavo Soares Mascarenhas Rodrigues on 04/01/2019.
//  Copyright © 2019 Gustavo Soares Mascarenhas Rodrigues. All rights reserved.
//

import XCTest
@testable import BRQiOSTest

class BRQiOSTestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testMovieViewModel() {
        let movie = Movie(id: "id", title: "title", genre: "genre", director: "director", released: "released", poster: "poster", actors: "actors")
        let movieViewModel = MovieViewModel(movie: movie)
        
        XCTAssertEqual(movie.title, movieViewModel.title)
        XCTAssertEqual(movie.id, movieViewModel.id)
    }
    
    func testDetailViewModel() {
        let movie = Movie(id: "id", title: "title", genre: "genre", director: "director", released: "released", poster: "poster", actors: "actors")
        let detailViewModel = DetailViewModel(movie: movie)
        
        XCTAssertEqual(movie.title, detailViewModel.title)
        XCTAssertEqual(movie.actors, detailViewModel.actors)
        XCTAssertEqual(movie.director, detailViewModel.director)
        XCTAssertEqual(movie.genre, detailViewModel.genre)
        XCTAssertEqual(movie.poster, detailViewModel.poster)
        XCTAssertEqual(movie.released, detailViewModel.released)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
