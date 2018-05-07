//
//  MovieDetailPresenter.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

class MovieDetailPresenter: MovieDetailPresenterProtocol {
    
    weak var view: MovieDetailViewProtocol?
    var wireFrame: MovieDetailWireFrameProtocol?
    var movie: MovieModel?
    
    func viewDidLoad() {
        view?.showMovieDetail(forMovie: movie!)
    }
    
}

