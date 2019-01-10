//
//  MoviesTableCell.swift
//  BRQiOSTest
//
//  Created by Gustavo Soares Mascarenhas Rodrigues on 04/01/2019.
//  Copyright © 2019 Gustavo Soares Mascarenhas Rodrigues. All rights reserved.
//

import UIKit

class MoviesTableCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterIv: UIImageView!
    
    var movieViewModel: MovieViewModel! {
        didSet{
            titleLabel.text = movieViewModel.title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(viewModel: MoviesCellViewModel) {
        self.titleLabel?.text = viewModel.labelValue()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
