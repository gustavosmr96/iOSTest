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
    
    private var detailViewModel: DetailViewModel = {
        return DetailViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewModel.setViewItems = { [weak self] () in
            DispatchQueue.main.async {
                self?.fillUI()
            }
        }
        detailViewModel.fetchMovie(id: id)
        styleUI()
    }
    
    func styleUI(){
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    func fillUI(){
        guard let movie = detailViewModel.movieDetails() else {return}
        self.titleLabel.text = movie.title
        self.releasedLabel.text = movie.released
        self.genreLabel.text = movie.genre
        self.directorLabel.text = movie.director
        self.actorsLabel.text = movie.actors
        self.posterIv.sd_setImage(with: URL(string: movie.poster!), placeholderImage: UIImage(named: "loading.png"))
    }
}
