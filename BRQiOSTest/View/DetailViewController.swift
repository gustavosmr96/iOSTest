//
//  DetailViewController.swift
//  BRQiOSTest
//
//  Created by Gustavo Soares Mascarenhas Rodrigues on 07/01/2019.
//  Copyright © 2019 Gustavo Soares Mascarenhas Rodrigues. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    @IBOutlet weak var posterIv: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    
    var id: String = ""
    
    fileprivate func fetchData(movieId: String) {
        Service.loadMovie(id: movieId, onComplete: { (movie) in
            let detailViewModel = DetailViewModel(movie: movie)
            DispatchQueue.main.async {
                self.fillUI(detailViewModel: detailViewModel)
            }
        }) { (error) in
            print(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(movieId: self.id)
    }
    
    func fillUI(detailViewModel: DetailViewModel){
        self.titleLabel.text = detailViewModel.title
        self.releasedLabel.text = detailViewModel.released
        self.genreLabel.text = detailViewModel.genre
        self.directorLabel.text = detailViewModel.director
        self.actorsLabel.text = detailViewModel.actors
        self.posterIv.sd_setImage(with: URL(string: detailViewModel.poster), placeholderImage: UIImage(named: "loading.png"))
    }
}
