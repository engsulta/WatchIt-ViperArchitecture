//
//  MovieDetailView.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

import UIKit

class MovieDetailView: UIViewController {
    
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var presenter: MovieDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
}

extension MovieDetailView: MovieDetailViewProtocol {
    
    func showMovieDetail(forMovie movie: MovieModel) {
        titleLabel?.text = movie.title
        let url = URL(string: movie.imageUrl)!
        let placeholderImage = UIImage(named: "placeholder")!
        movieImageView?.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }
    
}
