//
//  DetailViewController.swift
//  BRQiOSTest
//
//  Created by Gustavo Soares Mascarenhas Rodrigues on 07/01/2019.
//  Copyright © 2019 Gustavo Soares Mascarenhas Rodrigues. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var posterIv: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    
    var movie = Movie()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillUI()
    }
    
    func fillUI(){
        API.loadMovie(id: "tt0076759", onComplete: { (movie) in
            self.movie = movie
        }) { (error) in
            print(error)
        }
        titleLabel.text = movie.title
        releasedLabel.text = movie.released
        genreLabel.text = movie.genre
        directorLabel.text = movie.director
        actorsLabel.text = movie.actors
    }
    
}
